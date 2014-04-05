CREATE OR REPLACE VIEW recentUploads AS
SELECT imagePath, description, uploadDate, shortname, fulldescription
FROM photos AS P
JOIN photoCategories AS PC ON PC.categoryID = P.categoryID
ORDER BY uploadDate DESC
LIMIT 8;