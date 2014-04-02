
CREATE TABLE reportedPhotos(

	reporterID		INT,
	photoID			INT,
	description		VARCHAR,
	reportType		VARCHAR,
	reportDate		TIMESTAMP,

	—-what would we want the primary key to be… reporter id and the date… We would want users to be able to report a photo more than once, or maybe only once for the same reportType… Right now it is done as below.
	CONSTRAINT pk_reportedPhotos PRIMARY KEY (reporterID, photoID),
	CONSTRAINT fk_users_reporterID FOREIGN KEY (reporterID) REFERENCES users(userID),
	CONSTRAINT fk_photos_reportedPhoto FOREIGN KEY (photoID) REFERENCES photos(photoID),

);