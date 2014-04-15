/*
 * Wrapped functionality allowing the editting of a comment
 *
 * @Author: Alex
 */

CREATE OR REPLACE FUNCTION fn_edit_user_comment(commentID INT, newComment VARCHAR(2000))
RETURNS BOOLEAN
AS $$
BEGIN
	UPDATE tbl_comments
	SET comment = $2,
		editDate = NOW()
	WHERE tbl_comments.commentID = $1;
		RETURN TRUE;
	EXCEPTION WHEN OTHERS THEN
		RETURN FALSE;
END
$$ LANGUAGE plpgsql;
