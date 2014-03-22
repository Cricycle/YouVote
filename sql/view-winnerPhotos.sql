CREATE OR REPLACE VIEW winnerPhotos AS
SELECT imagePath, uploadDate, dateWon, shortname, fulldescription
FROM winners AS W
JOIN photos AS P ON P.photoID = W.photoID
JOIN photoCategories AS PC ON PC.categoryID = P.categoryID;