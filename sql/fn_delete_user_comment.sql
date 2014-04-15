/*
 * Wrapper to delete a user comment
 *
 * @Author: Alex
 */

CREATE OR REPLACE FUNCTION fn_delete_user_comment(commentID INT)
RETURNS BOOLEAN
AS $$
BEGIN
	DELETE FROM comments
	WHERE comments.commentID = $1;
		RETURN TRUE;
	EXCEPTION WHEN OTHERS THEN
		RETURN FALSE;
END
$$ LANGUAGE plpgsql;
