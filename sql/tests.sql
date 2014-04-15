-- Testing the userPhotos stored procedure function. On the Users page, the user's photos are displayed as a view.
-- Takes in a userID.
SELECT * FROM fn_get_user_photos(2);

SELECT * FROM tbl_photos
WHERE userID = 2;


-- On the home page, the winner's photos for categories is displayed as a view.
SELECT * FROM vw_winner_photos;


-- On the home page, below the winner's, recent uploads for photo categories are displayed.
SELECT * FROM vw_recent_uploads;

-- Deleting a user
SELECT * FROM fn_delete_user(5);
SELECT * FROM tbl_users;

-- To add stuff to the favoriteUsers table
-- the first parameter is the userIDOwner
-- the second parameter is the userIDFavorite
-- this will return a boolean for if it was validly inserted into the table
-- the second statement returns the favorite user table

SELECT * FROM fn_add_user_favorite_user(3, 2);
SELECT * from tbl_favorite_users;

-- To add stuff to the favoritePhotots table
-- the first parameter is the userID
-- the second parameter is the photoID
-- this will return a boolean for if it was validly inserted into the table
-- the second statement returns the favorite user table

SELECT * FROM fn_add_user_favorite_photo(3, 1);
SELECT * FROM tbl_favorite_photos;
