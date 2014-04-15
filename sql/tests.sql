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
SELECT fn_delete_user(5);
SELECT * FROM tbl_users;

-- To add stuff to the favoriteUsers table
-- the first parameter is the userIDOwner
-- the second parameter is the userIDFavorite
-- this will return a boolean for if it was validly inserted into the table
-- the second statement returns the favorite user table

SELECT fn_add_favorite_user(3, 2);
SELECT * from tbl_favorite_users;

-- To add stuff to the favoritePhotots table
-- the first parameter is the userID
-- the second parameter is the photoID
-- this will return a boolean for if it was validly inserted into the table
-- the second statement returns the favorite user table

SELECT fn_add_favorite_photo(3, 1);
SELECT * FROM tbl_favorite_photos;

-- Testing getting favorite photos of a user
SELECT * FROM fn_get_favorite_photos(1, 1, 5);
SELECT * FROM fn_get_favorite_photos(1, 2, 6);

-- Testing ranking photos by votes
SELECT * FROM fn_rank_photos_by_votes(1, 5);
SELECT * FROM fn_rank_photos_by_votes(1, 3);
SELECT * FROM fn_rank_photos_by_votes(3, 10);

-- Testing ranking users by votes
SELECT * FROM fn_rank_users_by_votes(5);
SELECT * FROM fn_rank_users_by_votes(10);
SELECT * FROM fn_rank_users_by_votes(10000);

-- Testing adding a comment
SELECT fn_add_user_comment(1, 'my comment', 1);
SELECT * FROM tbl_comments;

-- Testing editing a comment
SELECT fn_edit_user_comment(1, 'new comment lololololo');
SELECT * FROM tbl_comments;

-- Testing delete a comment
SELECT fn_delete_user_comment(4);
SELECT * FROM tbl_comments;

-- Testing add vote
SELECT fn_add_vote(6, 6);
SELECT * FROM tbl_votes;