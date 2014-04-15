/*
 * Wrapper which favorites a user for a given user.
 *
 * @Author: Meghan
 */

CREATE OR REPLACE FUNCTION fn_add_favorite_user(userIDOwner INT, userIDFavorite INT)
RETURNS BOOLEAN AS $$
BEGIN
	INSERT INTO tbl_favorite_users(userIDOwner, userIDFavorite, favoritedDate)
	VALUES ($1, $2, NOW());
	RETURN TRUE;
EXCEPTION
	WHEN OTHERS THEN
		RETURN FALSE;
	
END;
$$ LANGUAGE plpgsql;	
