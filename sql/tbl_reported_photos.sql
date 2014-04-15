/*
 * Records photos which have been reported by users as inappropriate.
 *
 * @Author: Meghan
 */

CREATE TABLE tbl_reported_photos (
	reporterID		INT,			-- userID of user who reported
	photoID			INT,			-- photoID that was reported
	description		VARCHAR(200),	-- additional information provided by user
	reportType		VARCHAR(50),	-- report type selected by user (stolen/explicit/etc)
	reportDate		TIMESTAMP,		-- when the report was made

	CONSTRAINT pk_reportedPhotos PRIMARY KEY (reporterID, photoID),
	CONSTRAINT fk_users_reporterID FOREIGN KEY (reporterID) REFERENCES tbl_users(userID),
	CONSTRAINT fk_photos_reportedPhoto FOREIGN KEY (photoID) REFERENCES tbl_photos(photoID)
);
