/*
 * This table stores the photos which have won the weekly votes.  The table
 * can be joined with tbl_photos to retrieve more information about the photo
 *
 * @Author: Chelsea
 */

CREATE TABLE tbl_winners (
	photoID 	INT,
	dateWon 	TIMESTAMP,
	
	CONSTRAINT fk_winners_photoID FOREIGN KEY (photoID) REFERENCES tbl_photos(photoID)
);
