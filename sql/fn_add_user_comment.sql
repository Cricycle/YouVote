/*
 * Wrapper which adds a user comment to a photo.
 *
 * @Author: Alex
 */

CREATE OR REPLACE FUNCTION fn_add_user_comment(photoID INT, comment VARCHAR(2000), userIDcommenter INT)
RETURNS BOOLEAN
AS $$
BEGIN
	INSERT INTO tbl_comments(photoID, comment, commentTime, userID, editDate) VALUES
		($1, $2, NOW(), $3, NOW());
		RETURN TRUE;
	EXCEPTION WHEN OTHERS THEN
		RETURN FALSE;
END
$$ LANGUAGE plpgsql;
