CREATE TABLE users(
	userID SERIAL PRIMARY KEY,
	username VARCHAR(30) NOT NULL,
	email VARCHAR(45) NOT NULL,
	firstname VARCHAR(45),
	lastname VARCHAR(45),
	salt VARCHAR(50),
	passwordhash VARCHAR(50) NOT NULL
);

CREATE TABLE photoCategories(
	categoryID SERIAL PRIMARY KEY,
	shortName VARCHAR(25),
	fullDescription VARCHAR(100)
);

CREATE TABLE photos(
	photoID SERIAL PRIMARY KEY,
	imagePath VARCHAR(250),
	userID INT REFERENCES users(userID),
	categoryID INT REFERENCES photoCategories(categoryID),
	description VARCHAR(100),
	imageSize INT,
	uploadDate TIMESTAMP
);

CREATE TABLE winners(
	photoID INT REFERENCES photos(photoID),
	dateWon TIMESTAMP
);

CREATE OR REPLACE VIEW winnerPhotos AS
SELECT imagePath, uploadDate, dateWon, shortname, fulldescription
FROM winners AS W
JOIN photos AS P ON P.photoID = W.photoID
JOIN photoCategories AS PC ON PC.categoryID = P.categoryID;

CREATE OR REPLACE VIEW recentUploads AS
SELECT imagePath, description, uploadDate, shortname, fulldescription
FROM photos AS P
JOIN photoCategories AS PC ON PC.categoryID = P.categoryID
ORDER BY uploadDate DESC
LIMIT 6;

CREATE OR REPLACE FUNCTION userPhotos(pUserID INT)
RETURNS TABLE(imagePath VARCHAR(250), description VARCHAR(100), uploadDate TIMESTAMP, shortName VARCHAR(25), fullDescription VARCHAR(100)) AS $$
BEGIN
    RETURN QUERY
    SELECT imagePath, description, uploadDate, shortname, fulldescription
    FROM Photos AS P
    JOIN photoCategories AS PC ON PC.categoryID = P.categoryID
    WHERE userID = pUserID;
END;
$$ LANGUAGE plpgsql;
