@echo off
SET PGPASSWORD=putpasswordhere
SET USER=putuserhere
SET DB=putdbhere

REM this won't work if there are active connections to the db
dropdb --if-exists -U %USER% %DB%
createdb -U %USER% %DB%
