CREATE OR REPLACE FUNCTION rank_photos_by_votes(topX INT DEFAULT 20)
RETURNS TABLE (
	photoID		INT,
	totalVotes	BIGINT,
	rank		BIGINT
) AS $$
BEGIN
	RETURN QUERY
		WITH cte1 AS (
			SELECT votes.photoID, COUNT(*) AS totalVotes, RANK() OVER (ORDER BY COUNT(*) DESC) AS rank
			FROM votes
			GROUP BY votes.photoID
		)
		SELECT cte1.photoID, cte1.totalVotes, cte1.rank
		FROM cte1
		WHERE cte1.rank <= $1;
END
$$ LANGUAGE plpgsql;