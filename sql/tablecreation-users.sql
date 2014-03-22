CREATE TABLE users(
	userID SERIAL PRIMARY KEY,
	username VARCHAR(30) NOT NULL,
	email VARCHAR(45) NOT NULL,
	firstname VARCHAR(45),
	lastname VARCHAR(45),
	salt VARCHAR(50),
	passwordhash VARCHAR(50) NOT NULL
);