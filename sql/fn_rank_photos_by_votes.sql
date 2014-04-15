/*
 * Retrieves a list of the topX photos by total number of votes for the given category
 *
 * @Author: Alex
 */

CREATE OR REPLACE FUNCTION fn_rank_photos_by_votes(categoryID INT, topX INT DEFAULT 20)
RETURNS TABLE (
	photoID		INT,
	totalVotes	BIGINT,
	rank		BIGINT
) AS $$
BEGIN
	RETURN QUERY
		WITH cte1 AS (
			SELECT votes.photoID, COUNT(*) AS totalVotes, RANK() OVER (ORDER BY COUNT(*) DESC) AS rank
			FROM tbl_votes AS v, tbl_photos AS p
			WHERE p.categoryID = $2
			GROUP BY votes.photoID
		)
		SELECT cte1.photoID, cte1.totalVotes, cte1.rank
		FROM cte1
		WHERE cte1.rank <= $1;
END
$$ LANGUAGE plpgsql;
