CREATE OR REPLACE FUNCTION userPhotos(pUserID INT)
RETURNS TABLE
	(imagePath VARCHAR(250), 
	description VARCHAR(100), 
	uploadDate TIMESTAMP, 
	shortName VARCHAR(25), 
	fullDescription VARCHAR(100)) AS $$
BEGIN
    RETURN QUERY
    SELECT P.imagePath, P.description, P.uploadDate, PC.shortname, PC.fulldescription
    FROM Photos AS P
    JOIN photoCategories AS PC ON PC.categoryID = P.categoryID
    WHERE userID = pUserID;
END;
$$ LANGUAGE plpgsql;
