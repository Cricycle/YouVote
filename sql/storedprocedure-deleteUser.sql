CREATE OR REPLACE FUNCTION deleteUser(pUserID INT)
RETURNS void AS $$
BEGIN
	DELETE FROM votes WHERE userID = pUserID;
	DELETE FROM users WHERE userID = pUserID;
	DELETE FROM comments WHERE userID = pUserID;
	DELETE FROM photos WHERE userID = pUserID;
	DELETE FROM favoritephotos WHERE userIDowner = pUserID;
	DELETE FROM favoriteusers WHERE userIDowner = pUserID;
END;
$$ LANGUAGE plpgsql;