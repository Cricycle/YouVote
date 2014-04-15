/*
 * Stores all relevant information about photos stored on the site.
 * 
 * @Author: Chelsea
 */

CREATE TABLE tbl_photos (
	photoID 		SERIAL,
	imagePath 		VARCHAR(250) NOT NULL,	-- filepath of image on the server
	userID 			INT,					-- user who uploaded the photo
	categoryID 		INT,					-- what category the photo belongs to
	description 	VARCHAR(500),			-- optional description by user about photo
	imageSize 		INT NOT NULL,			-- how many bytes the photo takes up on disk
	uploadDate 		TIMESTAMP NOT NULL,		-- when the photo was uploaded
	
	CONSTRAINT pk_photos_photoID PRIMARY KEY (photoID),
	CONSTRAINT fk_photos_users FOREIGN KEY (userID) REFERENCES tbl_users(userID),
	CONSTRAINT fk_photos_photoCategories FOREIGN KEY (categoryID) REFERENCES tbl_photo_categories(categoryID)
);

CREATE INDEX idx_photos_userID ON tbl_photos(userID, uploadDate);
CREATE INDEX idx_photos_categoryID ON tbl_photos(categoryID, uploadDate);
