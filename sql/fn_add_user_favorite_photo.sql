CREATE OR REPLACE FUNCTION add_user_favorite_photo (INT, INT)
RETURNS BOOLEAN AS $$
BEGIN
	INSERT INTO favoritePhotos(userIDOwner, photoIDFavorite, favoritedDate)
	VALUES ($1 , $2, now() );
	RETURN TRUE;
EXCEPTION
	WHEN OTHERS THEN
		RETURN FALSE;
	
END;
$$ LANGUAGE plpgsql;
	
