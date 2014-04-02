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

--To add stuff to the favoriteUsers table
--the first parameter is the userIDOwner
--the second parameter is the userIDFavorite
--this will return a boolean for if it was validly inserted into the table
--the second statement returns the favorite user table

SELECT * FROM add_user_favorite_user( 3, 2);
SELECT * from favoriteUsers;

--To add stuff to the favoritePhotots table
--the first parameter is the userID
--the second parameter is the photoID
--this will return a boolean for if it was validly inserted into the table
--the second statement returns the favorite user table

SELECT * FROM add_user_favorite_photo(3,1);
SELECT * FROM favoritePhotos;
