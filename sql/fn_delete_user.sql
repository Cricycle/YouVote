/*
 * Wrapper which deletes a user from all places he is referenced
 * Might be better to figure out a better way to do this, because it will
 * break if we add new tables.
 *
 * @Author: Chelsea
 */

CREATE OR REPLACE FUNCTION fn_delete_user(pUserID INT)
RETURNS void AS $$
BEGIN
	DELETE FROM tbl_votes WHERE userID = pUserID;
	DELETE FROM tbl_comments WHERE userID = pUserID;
	DELETE FROM tbl_photos WHERE userID = pUserID;
	DELETE FROM tbl_favorite_photos WHERE userIDowner = pUserID;
	DELETE FROM tbl_favorite_users WHERE userIDowner = pUserID;
	DELETE FROM tbl_users WHERE userID = pUserID;
END;
$$ LANGUAGE plpgsql;
