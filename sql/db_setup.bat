@echo off
SET PGPASSWORD=chelocean
SET USER=postgres
SET DB=YouVote

REM table creation files
psql -d %DB% -U %USER% -f tbl_users.sql
psql -d %DB% -U %USER% -f tbl_photo_categories.sql
psql -d %DB% -U %USER% -f tbl_photos.sql
psql -d %DB% -U %USER% -f tbl_reported_photos.sql
psql -d %DB% -U %USER% -f tbl_votes.sql
psql -d %DB% -U %USER% -f tbl_winners.sql
psql -d %DB% -U %USER% -f tbl_comments.sql
psql -d %DB% -U %USER% -f tbl_favorite_users.sql
psql -d %DB% -U %USER% -f tbl_favorite_photos.sql

REM function creation files
psql -d %DB% -U %USER% -f fn_add_favorite_photo.sql
psql -d %DB% -U %USER% -f fn_add_favorite_user.sql
psql -d %DB% -U %USER% -f fn_add_user_comment.sql
psql -d %DB% -U %USER% -f fn_add_vote.sql
psql -d %DB% -U %USER% -f fn_delete_user.sql
psql -d %DB% -U %USER% -f fn_delete_user_comment.sql
psql -d %DB% -U %USER% -f fn_edit_user_comment.sql
psql -d %DB% -U %USER% -f fn_get_favorite_photos.sql
psql -d %DB% -U %USER% -f fn_get_user_photos.sql
psql -d %DB% -U %USER% -f fn_rank_photos_by_votes.sql
psql -d %DB% -U %USER% -f fn_rank_users_by_votes.sql

REM view creation files
psql -d %DB% -U %USER% -f vw_recent_uploads.sql
psql -d %DB% -U %USER% -f vw_winner_photos.sql
