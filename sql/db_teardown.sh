#!/bin/sh

PGPASSWORD=chelocean
USER=postgres
DB=YouVote

# this won't work if there are active connections to the db
dropdb --if-exists -U $USER $DB
createdb -U $USER $DB
