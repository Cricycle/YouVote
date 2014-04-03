CREATE OR REPLACE FUNCTION add_user_comment(photoID INT, comment VARCHAR(2000), userID INT)
RETURNS BOOLEAN
AS $$
BEGIN
	INSERT INTO comments(photoID, comment, commentTime, userID, editDate) VALUES
		($1, $2, NOW(), $3, NOW());
		RETURN TRUE;
	EXCEPTION WHEN OTHERS THEN
		RETURN FALSE;
END
$$ LANGUAGE plpgsql;
