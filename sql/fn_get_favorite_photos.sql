/*
 * Retrieves the favorite photos of a given user, ordered by favorited date
 *
 * @Author: Alex
 */

CREATE OR REPLACE FUNCTION fn_get_favorite_photos(userID INT, lowRow INT, highRow INT)
RETURNS TABLE (
	photoID INT
) AS $$
BEGIN
	RETURN QUERY
		WITH cte1 AS (
			SELECT photoIDfavorite AS photoID, ROW_NUMBER() OVER (ORDER BY favoritedDate DESC) AS rowNum
			FROM tbl_favorite_photos
			WHERE userIDOwner = $1
		)
		SELECT cte1.photoID AS photoID
		FROM cte1
		WHERE cte1.rowNum >= $2 AND cte1.rowNum <= $3;
END
$$ LANGUAGE plpgsql;
