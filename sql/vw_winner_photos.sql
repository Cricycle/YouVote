/*
 * This view is used to display the recent winner's photos on the front page.
 *
 * @Author: Chelsea
 */

CREATE OR REPLACE VIEW vw_winner_photos AS
SELECT p.imagePath, p.uploadDate, w.dateWon, pc.categoryID, pc.shortName
FROM tbl_winners AS w
	JOIN tbl_photos AS p
		ON p.photoID = w.photoID
	JOIN tbl_photo_categories AS pc
		ON pc.categoryID = p.categoryID;
