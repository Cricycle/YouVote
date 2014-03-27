CREATE OR REPLACE FUNCTION rank_users_by_votes(topX INT DEFAULT 20)
RETURNS TABLE (
	userID		INT,
	totalVotes	BIGINT,
	rank 		BIGINT
) AS $$
BEGIN
	RETURN QUERY
		WITH cte1 AS (
			SELECT photos.userID AS userID, COUNT(*) AS totalVotes, RANK() OVER (ORDER BY COUNT(*) DESC) AS rank
			FROM votes, photos
			WHERE votes.photoID = photos.photoID
			GROUP BY photos.userID
		)
		SELECT cte1.userID, cte1.totalVotes, cte1.rank
		FROM cte1
		WHERE cte1.rank <= $1;
END
$$ LANGUAGE plpgsql;