

CREATE TABLE favoritePhotos(

	userIDOwner		INT,
	photoIDFavorite		INT, 
	favoritedDate		TIMESTAMP,

	CONSTRAINT pk_favoritePhotos PRIMARY KEY (userIDOwner, photoIDFavorite),
	CONSTRAINT fk_users_userIDOwner FOREIGN KEY (userIDOwner) REFERENCES users(userID),
	CONSTRAINT fk_photos_photoIDFavorite FOREIGN KEY (photoIDFavorite) REFERENCES photos(photoID)

);

CREATE INDEX ON favoritePhotos(favoritedDate);