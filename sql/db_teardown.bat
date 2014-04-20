@echo off
SET PGPASSWORD=chelocean
SET USER=postgres
SET DB=YouVote

REM this won't work if there are active connections to the db
dropdb --if-exists -U %USER% %DB%
createdb -U %USER% %DB%
