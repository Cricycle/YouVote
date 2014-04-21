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
	('alex', 'alex-email', 'a', 'lex', 'JCpticRBy', '4c711b8a297039e42447cb219ad81a8d95cd6aba0f763a0395'),
	('chelsea', 'chelsea-email', 'c', 'sea', 'JCpticRBy', '4c711b8a297039e42447cb219ad81a8d95cd6aba0f763a0395'),
	('meghan', 'meghan-email', 'm', 'han', 'JCpticRBy', '4c711b8a297039e42447cb219ad81a8d95cd6aba0f763a0395'),
	('kyle', 'kyle-email', 'ky', 'lie', 'JCpticRBy', '4c711b8a297039e42447cb219ad81a8d95cd6aba0f763a0395'),
	('jj', 'jj-email', 'a', 'j', 'JCpticRBy', '4c711b8a297039e42447cb219ad81a8d95cd6aba0f763a0395'),
	('afroman', 'afro-email', 'a', 'fro', 'JCpticRBy', '4c711b8a297039e42447cb219ad81a8d95cd6aba0f763a0395');

INSERT INTO tbl_photo_categories(shortName, fullDescription) VALUES
	('cat1', 'this is all about origin cat'),
	('cat9', 'this is about category 9 hurricanes'),
	('ca9', 'cats that pretend to be dogs'),
  ('beauty', 'random black and white beauties');

INSERT INTO tbl_photos(imagePath, userID, categoryID, description, imageSize, uploadDate) VALUES
	('images/1.jpg', 1, 1, 'a', 1, '3-20-2014'),
	('images/2.jpg', 1, 1, 'b', 2, '3-21-2014'),
	('images/3.jpg', 1, 2, 'c', 4, '3-22-2014'),
	('images/4.jpg', 1, 3, 'd', 8, '3-23-2014'),
	('images/5.jpg', 2, 1, 'e', 16, '3-24-2014'),
	('images/6.jpg', 2, 3, 'f', 32, '3-25-2014'),
	('images/7.jpg', 2, 3, 'g', 64, '3-26-2014'),
	('images/8.jpg', 3, 1, 'h', 128, '3-27-2014'),
	('images/9.jpg', 3, 2, 'i', 256, '3-28-2014'),
	('images/10.jpg', 4, 2, 'j', 512, '3-29-2014'),
	('images/11.jpg', 6, 1, 'k', 1024, '3-30-2014'),
	('images/12.jpg', 6, 3, 'l', 8, '3-23-2014'),
	('images/13.jpg', 2, 1, 'm', 16, '3-24-2014'),
	('images/14.jpg', 2, 3, 'n', 32, '3-25-2014'),
	('images/15.jpg', 2, 3, 'o', 64, '3-26-2014'),
	('images/16.jpg', 3, 1, 'p', 128, '3-27-2014'),
	('images/17.jpg', 3, 2, 'q', 256, '3-28-2014'),
	('images/18.jpg', 4, 2, 'r', 512, '3-29-2014'),
	('images/19.jpg', 6, 1, 's', 1024, '3-30-2014'),
	('images/20.jpg', 6, 1, 't', 1024, '3-30-2014'),
  ('images/full/1.jpg', 4, 4, 'aa', 1025, '4-04-2014'),
  ('images/full/2.jpg', 4, 4, 'ab', 1025, '4-04-2014'),
  ('images/full/3.jpg', 4, 4, 'ac', 1025, '4-05-2014'),
  ('images/full/4.jpg', 4, 4, 'ad', 1025, '4-06-2014'),
  ('images/full/5.jpg', 4, 4, 'ae', 1025, '4-07-2014'),
  ('images/full/6.jpg', 4, 4, 'af', 1025, '4-08-2014'),
  ('images/full/7.jpg', 4, 4, 'ag', 1025, '4-09-2014'),
  ('images/full/8.jpg', 4, 4, 'ah', 1025, '4-03-2014'),
  ('images/full/9.jpg', 4, 4, 'ai', 1025, '4-07-2014'),
  ('images/full/10.jpg', 4, 4, 'aj', 1025, '4-04-2014'),
  ('images/full/11.jpg', 4, 4, 'ak', 1025, '4-04-2014');
  
  

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
	(5, 7, '3-29-2014'),
	(5, 6, '3-29-2014'),
	(5, 12, '3-29-2014'),
	(5, 15, '3-29-2014'),
	(5, 18, '3-29-2014'),
	(5, 20, '3-29-2014'),
	(6, 14, '3-29-2014'),
	(6, 15, '3-30-2014'),
	(6, 16, '3-29-2014'),
	(6, 17, '3-29-2014');
  
	

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

