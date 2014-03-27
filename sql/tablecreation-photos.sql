CREATE TABLE photos(
	photoID SERIAL,
	imagePath VARCHAR(250),
	userID INT,
	categoryID INT,
	description VARCHAR(100),
	imageSize INT,
	uploadDate TIMESTAMP,
	
	CONSTRAINT pk_photos PRIMARY KEY (photoID),
	CONSTRAINT fk_photos_users FOREIGN KEY (userID) REFERENCES users(userID),
	CONSTRAINT fk_photos_photoCategories FOREIGN KEY (categoryID) REFERENCES photoCategories(categoryID)
);


CREATE INDEX idx_photos_UserID ON photos(userID, uploadDate);
CREATE INDEX idx_photos_CategoryID ON photos(categoryID, uploadDate);