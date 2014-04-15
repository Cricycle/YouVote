/*
 * Intended use is with an external tool to periodically run this sql.
 *
 * @Author: Alex
 */

DELETE FROM tbl_votes
WHERE voteTime < CURRENT_TIMESTAMP - INTERVAL '8 days';
