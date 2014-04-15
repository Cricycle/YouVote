DELETE FROM tbl_votes;
DELETE FROM tbl_comments;
DELETE FROM tbl_winners;
DELETE FROM tbl_favorite_photos;
DELETE FROM tbl_photos;
DELETE FROM tbl_photo_categories;
DELETE FROM tbl_users;

ALTER SEQUENCE tbl_users_userid_seq RESTART WITH 1;
ALTER SEQUENCE tbl_photo_categories_categoryid_seq RESTART WITH 1;
ALTER SEQUENCE tbl_photos_photoid_seq RESTART WITH 1;
ALTER SEQUENCE tbl_comments_commentid_seq RESTART WITH 1;

INSERT INTO tbl_users(username, email, firstname, lastname, salt, passwordhash) VALUES
	('alex', 'alex-email', 'a', 'lex', 'blah', 'blah'),
	('chelsea', 'chelsea-email', 'c', 'sea', 'blah', 'blah'),
	('meghan', 'meghan-email', 'm', 'han', 'blah', 'blah'),
	('kyle', 'kyle-email', 'ky', 'lie', 'blah', 'blah'),
	('jj', 'jj-email', 'a', 'j', 'jj', 'blah'),
	('afroman', 'afro-email', 'a', 'fro', 'blah', 'blah');

INSERT INTO tbl_photo_categories(shortName, fullDescription) VALUES
	('cat1', 'this is all about origin cat'),
	('cat9', 'this is about category 9 hurricanes'),
	('ca9', 'cats that pretend to be dogs');

INSERT INTO tbl_photos(imagePath, userID, categoryID, description, imageSize, uploadDate) VALUES
	('image10_path_a', 1, 1, 'a', 1, '3-20-2014'),
	('image11_path_a', 1, 1, 'b', 2, '3-21-2014'),
	('image12_path_a', 1, 2, 'c', 4, '3-22-2014'),
	('image13_path_a', 1, 3, 'd', 8, '3-23-2014'),
	('image14_path_c', 2, 1, 'e', 16, '3-24-2014'),
	('image15_path_c', 2, 3, 'f', 32, '3-25-2014'),
	('image16_path_c', 2, 3, 'g', 64, '3-26-2014'),
	('image17_path_m', 3, 1, 'h', 128, '3-27-2014'),
	('image18_path_m', 3, 2, 'u', 256, '3-28-2014'),
	('image19_path_k', 4, 2, 'j', 512, '3-29-2014'),
	('image20_path_af', 6, 1, 'k', 1024, '3-30-2014');

INSERT INTO tbl_favorite_photos(userIDOwner, photoIDfavorite, favoritedDate) VALUES
	(1, 1, '3-20-2014'),
	(1, 2, '3-21-2014'),
	(1, 3, '3-22-2014'),
	(1, 4, '3-23-2014'),
	(1, 5, '3-24-2014'),
	(1, 6, '3-25-2014'),
	(1, 7, '3-26-2014'),
	(1, 8, '3-27-2014'),
	(1, 9, '3-28-2014'),
	(1, 10, '3-20-2014'),
	(1, 11, '3-20-2014'),
	(2, 1, '3-27-2014'),
	(2, 2, '3-27-2014'),
	(2, 9, '3-27-2014'),
	(2, 10, '3-20-2014'),
	(5, 7, '3-29-2014');
	

INSERT INTO tbl_votes(userID, photoID, voteTime) VALUES
	(1, 1, '3-27-2014'),
	(1, 2, '3-27-2014'),
	(1, 3, '3-27-2014'),
	(1, 4, '3-27-2014'),
	(1, 5, '3-27-2014'),
	(1, 6, '3-27-2014'),
	(1, 7, '3-27-2014'),
	(1, 8, '3-27-2014'),
	(2, 1, '3-27-2014'),
	(2, 2, '3-27-2014'),
	(2, 3, '3-27-2014'),
	(2, 4, '3-27-2014'),
	(2, 5, '3-27-2014'),
	(2, 6, '3-27-2014'),
	(2, 7, '3-27-2014'),
	(2, 8, '3-27-2014'),
	(3, 1, '3-27-2014'),
	(3, 2, '3-27-2014'),
	(3, 3, '3-27-2014'),
	(3, 4, '3-27-2014'),
	(3, 5, '3-27-2014'),
	(3, 6, '3-27-2014'),
	(3, 7, '3-27-2014'),
	(3, 8, '3-27-2014'),
	(4, 5, '3-27-2014'),
	(4, 6, '3-27-2014'),
	(4, 7, '3-27-2014'),
	(4, 8, '3-27-2014'),
	(5, 8, '3-27-2014'),
	(6, 3, '3-27-2014'),
	(6, 4, '3-27-2014'),
	(6, 5, '3-27-2014'),
	(3, 9, '3-27-2014'),
	(3, 10, '3-27-2014'),
	(3, 11, '3-27-2014');
	
INSERT INTO tbl_winners(photoID, dateWon) VALUES
	(1, '3-31-2014'),
	(3, '3-31-2014'),
	(5, '3-31-2014'),
	(6, '3-31-2014'),
	(7, '3-31-2014'),
	(10, '3-31-2014');

INSERT INTO tbl_comments(photoID, comment, commenttime, userid, editdate) VALUES
	(1, 'comment the first', '3-20-2014', 1, '3-20-2014'),
	(5, 'com on p5', now(), 2, now()),
	(5, 'another on p5', now(), 3, now());

