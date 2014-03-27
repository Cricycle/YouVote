CREATE TABLE photos(
	photoID SERIAL PRIMARY KEY,
	imagePath VARCHAR(250),
	userID INT REFERENCES users(userID),
	categoryID INT REFERENCES photoCategories(categoryID),
	description VARCHAR(100),
	imageSize INT,
	uploadDate TIMESTAMP,
	
	CONSTRAINT fk_photos_users FOREIGN KEY (userID) REFERENCES users(userID)
);


CREATE INDEX idx_photos_UserID ON photos(userID, uploadDate);
CREATE INDEX idx_photos_CategoryID ON photos(categoryID, uploadDate);