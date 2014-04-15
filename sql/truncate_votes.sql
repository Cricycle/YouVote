/*
 * Intended use is with an external tool to periodically run this sql.
 *
 * @Author: Alex
 */

DELETE FROM votes
WHERE voteDate < CURRENT_TIMESTAMP - INTERVAL '8 days';
