/*
 * Retrieves all the necessary information to display the photos of a user
 *
 * @Author: Chelsea
 */

CREATE OR REPLACE FUNCTION fn_get_user_photos(pUserID INT)
RETURNS TABLE
	(imagePath 		VARCHAR(250), 
	description 	VARCHAR(100), 
	uploadDate 		TIMESTAMP,
	categoryID		INT,
	shortName 		VARCHAR(25)) AS $$
BEGIN
    RETURN QUERY
		SELECT p.imagePath, p.description, p.uploadDate, p.categoryID, pc.shortName
		FROM tbl_photos AS p
			JOIN tbl_photo_categories AS pc
				ON pc.categoryID = p.categoryID
		WHERE userID = pUserID;
END;
$$ LANGUAGE plpgsql;
