CREATE OR REPLACE FUNCTION add_user_favorite_user (userIDOwner INT, userIDFavorite INT)
RETURNS BOOLEAN AS $$
BEGIN
	INSERT INTO favoriteUsers(userIDOwner, userIDFavorite, favoritedDate)
	VALUES ($1, $2, now() );
	RETURN TRUE;
EXCEPTION
	WHEN OTHERS THEN
		RETURN FALSE;
	
END;
$$ LANGUAGE plpgsql;	
