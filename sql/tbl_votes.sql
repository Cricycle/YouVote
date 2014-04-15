/*
 * This table stores the individual votes made.  It restricts a user to only
 * a single vote per photo.
 *
 * @Author: Alex
 */

CREATE TABLE tbl_votes (
	userID		INT,				-- user who voted
	photoID		INT,				-- photo they voted on
	voteTime	TIMESTAMP NOT NULL,	-- when they voted

	CONSTRAINT pk_one_vote PRIMARY KEY (userID, photoID),
	CONSTRAINT fk_votes_user FOREIGN KEY (userID) REFERENCES tbl_users(userID),
	CONSTRAINT fk_photo FOREIGN KEY (photoID) REFERENCES tbl_photos(photoID)
);
