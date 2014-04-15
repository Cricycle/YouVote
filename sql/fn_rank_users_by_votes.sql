/*
 * Retrieves a list of the topX users, when they are sorted by total number of votes
 *
 * @Author: Alex
 */

CREATE OR REPLACE FUNCTION fn_rank_users_by_votes(topX INT DEFAULT 20)
RETURNS TABLE (
	userID		INT,
	totalVotes	BIGINT,
	rank 		BIGINT
) AS $$
BEGIN
	RETURN QUERY
		WITH cte1 AS (
			SELECT p.userID AS userID, COUNT(*) AS totalVotes, RANK() OVER (ORDER BY COUNT(*) DESC) AS rank
			FROM tbl_votes AS v, tbl_photos AS p
			WHERE v.photoID = p.photoID
			GROUP BY p.userID
		)
		SELECT cte1.userID, cte1.totalVotes, cte1.rank
		FROM cte1
		WHERE cte1.rank <= $1;
END
$$ LANGUAGE plpgsql;
