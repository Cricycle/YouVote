CREATE TABLE Users (
	userID serial PRIMARY KEY,
	email VARCHAR(45),
	password VARCHAR(45),
	firstname VARCHAR(45),
	lastname VARCHAR(45)
);


CREATE TABLE PhotoCategory (
	categoryID serial PRIMARY KEY,
	description VARCHAR(45)
);


CREATE TABLE Pictures (
	pictureID serial PRIMARY KEY,
	userID INT,
	categoryID INT,
	description VARCHAR(250),
	picture BYTEA,
	winnerDate DATE
);


CREATE TABLE Voters (
	voterID serial PRIMARY KEY,
	userID INT,
	pictureID INT
);


CREATE TABLE Comments (
	commentID serial PRIMARY KEY,
	userID INT,
	pictureID INT,
	comment VARCHAR(250)
);
