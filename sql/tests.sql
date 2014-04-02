--Testing the userPhotos stored procedure function. On the Users page, the user's photos are displayed as a view.
--Takes in a userID.
SELECT * FROM userPhotos(2);

SELECT * FROM photos
WHERE userID = 2;


--On the home page, the winner's photos for categories is displayed as a view.
SELECT * FROM winnerPhotos;


--On the home page, below the winner's, recent uploads for photo categories are displayed.
SELECT * FROM recentUploads;

--Deleting a user
SELECT * FROM deleteUser(5);
SELECT * FROM users;