#!/bin/sh

PGPASSWORD=putpasswordhere
USER=putusernamehere
DB=putdbnamehere

# this won't work if there are active connections to the db
dropdb --if-exists -U $USER $DB
createdb -U $USER $DB
