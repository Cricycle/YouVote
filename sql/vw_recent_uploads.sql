/*
 * This view is used to display the most recently uploaded photos on the front
 * page, below the displayed winner photos.
 *
 * @Author: Chelsea
 */

CREATE OR REPLACE VIEW vw_recent_uploads AS
SELECT p.imagePath, p.description, p.uploadDate, pc.categoryID, pc.shortName
FROM tbl_photos AS p
	JOIN tbl_photo_categories AS pc
		ON pc.categoryID = p.categoryID;
