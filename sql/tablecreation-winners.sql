CREATE TABLE winners(
	photoID INT REFERENCES photos(photoID),
	dateWon TIMESTAMP
);