
CREATE TABLE comments(

	commentID 		SERIAL,
	photoID 		INT,
	comment			VARCHAR(2000) NOT NULL,
	commentTime		TIMESTAMP,
	userID			INT,
	editDate		TIMESTAMP,

	CONSTRAINT pk_comment PRIMARY KEY (commentID),
	CONSTRAINT fk_comments_photo FOREIGN KEY (photoID) REFERENCES photos(photoID),
	CONSTRAINT fk_comments_user FOREIGN KEY	 (userID) REFERENCES users(userID)

);