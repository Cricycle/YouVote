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
	INSERT INTO tbl_votes(userID, photoID, voteTime) VALUES ($1, $2, NOW());
		RETURN TRUE;
	EXCEPTION WHEN OTHERS THEN
        DELETE FROM tbl_votes
        WHERE userID = $1
        AND tbl_votes.photoID = $2;
		RETURN FALSE;
END
$$ LANGUAGE plpgsql;
