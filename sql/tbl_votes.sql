CREATE TABLE votes (
	userID		INT,
	photoID		INT,
	voteDate	DATE,

	CONSTRAINT pk_one_vote PRIMARY KEY (userID, photoID),
	CONSTRAINT fk_user FOREIGN KEY (userID) REFERENCES Users(userID),
	CONSTRAINT fk_photo FOREIGN KEY (photoID) REFERENCES Photos(photoID)
);