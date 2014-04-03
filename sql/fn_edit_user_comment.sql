CREATE OR REPLACE FUNCTION edit_user_comment(commentID INT, newComment VARCHAR(2000))
RETURNS BOOLEAN
AS $$
BEGIN
	UPDATE comments
	SET comment = $2,
		editDate = NOW()
	WHERE comments.commentID = $1;
		RETURN TRUE;
	EXCEPTION WHEN OTHERS THEN
		RETURN FALSE;
END
$$ LANGUAGE plpgsql;