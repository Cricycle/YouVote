/*
 * This table stores all the information about a user profile, including
 * password hash.
 *
 * @Author: Chelsea
 */

CREATE TABLE tbl_users (

	userID 			SERIAL,
	username 		VARCHAR(30) NOT NULL,	-- personal username, used to log in
	email 			VARCHAR(45) NOT NULL,	-- email used to verify account
	firstname 		VARCHAR(45) NOT NULL,
	lastname 		VARCHAR(45) NOT NULL,
	salt 			VARCHAR(50) NOT NULL,	-- password salt: should be distinct per user
	passwordhash 	VARCHAR(50) NOT NULL,	-- used to validate login credentials
	
	CONSTRAINT pk_users_userID PRIMARY KEY (userID),
	CONSTRAINT unq_users_username UNIQUE (username)
);
