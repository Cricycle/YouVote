/*
 * Stores the list of photos that a user has favorited
 *
 * @Author: Meghan
 */

CREATE TABLE tbl_favorite_photos (
	userIDOwner			INT,	-- user who did the favoriting
	photoIDFavorite		INT, 	-- the favorited photo
	favoritedDate		TIMESTAMP,

	CONSTRAINT pk_favoritePhotos PRIMARY KEY (userIDOwner, photoIDFavorite),
	CONSTRAINT fk_users_userIDOwner FOREIGN KEY (userIDOwner) REFERENCES tbl_users(userID),
	CONSTRAINT fk_photos_photoIDFavorite FOREIGN KEY (photoIDFavorite) REFERENCES tbl_photos(photoID)
);

CREATE INDEX idx_favorite_photos_date ON tbl_favorite_photos(favoritedDate);
