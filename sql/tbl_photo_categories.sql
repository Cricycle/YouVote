/*
 * Descriptive table, which lists what type of photo categories there are
 * and a longer description about what photos fit the category.
 *
 * @Author: Chelsea
 */

CREATE TABLE tbl_photo_categories (
	categoryID 			SERIAL,
	shortName 			VARCHAR(25) NOT NULL,	-- easy to say name for the category
	fullDescription 	VARCHAR(200) NOT NULL,	-- longer description about the category
	
	CONSTRAINT pk_photo_categories_categoryID PRIMARY KEY (categoryID)
);
