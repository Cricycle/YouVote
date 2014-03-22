CREATE TABLE photos(
	photoID SERIAL PRIMARY KEY,
	imagePath VARCHAR(250),
	userID INT REFERENCES users(userID),
	categoryID INT REFERENCES photoCategories(categoryID),
	description VARCHAR(100),
	imageSize INT,
	uploadDate TIMESTAMP
);