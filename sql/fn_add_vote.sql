/*
 * Wrapper which allows a user to vote.  Will not add the vote if the user
 * has already voted on that photo.
 *
 * @Author: Alex
 */

CREATE OR REPLACE FUNCTION fn_add_vote(userIDvoter INT, photoID INT)
RETURNS BOOLEAN
AS $$
BEGIN
	INSERT INTO tbl_votes(userID, photoID, voteDate) VALUES ($1, $2, NOW());
		RETURN TRUE;
	EXCEPTION WHEN OTHERS THEN
		RETURN FALSE;
END
$$ LANGUAGE plpgsql;
