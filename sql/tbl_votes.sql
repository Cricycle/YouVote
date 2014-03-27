CREATE TABLE votes (
	userID		INT,
	photoID		INT,
	voteDate	DATE,

	CONSTRAINT pk_one_vote PRIMARY KEY (userID, photoID),
	CONSTRAINT fk_votes_user FOREIGN KEY (userID) REFERENCES users(userID),
	CONSTRAINT fk_photo FOREIGN KEY (photoID) REFERENCES photos(photoID)
);