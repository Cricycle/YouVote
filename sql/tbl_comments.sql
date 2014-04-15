/*
 * Stores all the comments on the site, and some associated metadata
 *
 * @Author: Alex
 */

CREATE TABLE tbl_comments (
	commentID 		SERIAL,
	photoID 		INT,					-- photo that was commented on
	comment			VARCHAR(2000) NOT NULL,	-- content of the comment
	commentTime		TIMESTAMP,				-- when the comment was originally made
	userID			INT,					-- who made the comment
	editDate		TIMESTAMP NOT NULL,		-- when the comment was last edited

	CONSTRAINT pk_comment PRIMARY KEY (commentID),
	CONSTRAINT fk_comments_photo FOREIGN KEY (photoID) REFERENCES tbl_photos(photoID),
	CONSTRAINT fk_comments_user FOREIGN KEY	 (userID) REFERENCES tbl_users(userID)
);
