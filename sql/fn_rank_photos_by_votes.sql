/*
 * Retrieves a list of the topX photos by total number of votes for the given category
 *
 * @Author: Alex
 */

CREATE OR REPLACE FUNCTION fn_rank_photos_by_votes(categoryID INT, topX INT DEFAULT 20)
RETURNS TABLE (
	photoID		INT,
	imagePath	TEXT,
	totalVotes	BIGINT,
	rank		BIGINT
) AS $$
BEGIN
	RETURN QUERY
		WITH cte1 AS (
			SELECT v.photoID, MAX(p.imagePath) AS imagePath, COUNT(*) AS totalVotes, RANK() OVER (ORDER BY COUNT(*) DESC) AS rank
			FROM tbl_votes AS v, tbl_photos AS p
			WHERE p.categoryID = $1
				AND p.photoID = v.photoID
			GROUP BY v.photoID
		)
		SELECT cte1.photoID, cte1.imagePath, cte1.totalVotes, cte1.rank
		FROM cte1
		WHERE cte1.rank <= $2;
END;
$$ LANGUAGE plpgsql;
