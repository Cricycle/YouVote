
CREATE TABLE favoriteUsers(
	
	userIDOwner		TIMESTAMP,
	userIDFavorite		INT,
	favoritedDate		TIMESTAMP,

	CONSTRAINT pk_favoriteUsers PRIMARY KEY (userIDOwner, userIDFavorite),
	CONSTRAINT fk_users_userIDOwner FOREIGN KEY (userIDOwner) REFERENCES users(userID),
	CONSTRAINT fk_users_userIDFavorite FOREIGN KEY (userIDFavorite) REFERENCES users(userID),
	CONSTRAINT chk_userIDOwner_nottEqual_userIDFavorite CHECK (userIDOwner <> userIDFavorite)

);