/*
 * Records the relationship between a user and the list of users they have
 * favorited.
 *
 * @Author: Meghan
 */

CREATE TABLE tbl_favorite_users (
	userIDOwner			INT,		-- the user who did the favoriting
	userIDFavorite		INT,		-- the user who was favorited
	favoritedDate		TIMESTAMP DEFAULT NOW(),

	CONSTRAINT pk_favoriteUsers PRIMARY KEY (userIDOwner, userIDFavorite),
	CONSTRAINT fk_users_userIDOwner FOREIGN KEY (userIDOwner) REFERENCES tbl_users(userID),
	CONSTRAINT fk_users_userIDFavorite FOREIGN KEY (userIDFavorite) REFERENCES tbl_users(userID),
	CONSTRAINT chk_userIDOwner_notEqual_userIDFavorite CHECK (userIDOwner <> userIDFavorite)
);
