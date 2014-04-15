/*
 * Wrapper to add a favorite photo for a user
 *
 * @Author: Meghan
 */

CREATE OR REPLACE FUNCTION fn_add_favorite_photo (userIDOwner INT, photoIDFavorite INT)
RETURNS BOOLEAN AS $$
BEGIN
	INSERT INTO tbl_favorite_photos(userIDOwner, photoIDFavorite, favoritedDate)
	VALUES ($1 , $2, NOW());
	RETURN TRUE;
EXCEPTION
	WHEN OTHERS THEN
		RETURN FALSE;
	
END;
$$ LANGUAGE plpgsql;
	