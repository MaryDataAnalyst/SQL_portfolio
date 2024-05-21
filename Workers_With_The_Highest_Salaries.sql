/*
Calculate each user's average session time. 
A session is defined as the time difference between a page_load and page_exit. 

For simplicity, assume a user has only 1 session per day and if there are multiple of the same events on that day, 
consider only the latest page_load and earliest page_exit, with an obvious restriction 
that load time event should happen before exit time event . 

Output the user_id and their average session time.

Table facebook_web_log:
user_id: int
timestamp: datetime
action: varchar
*/

SELECT user_id, AVG(timestampdiff(second, ld, ex)) AS session_time
FROM (
    SELECT 
        Date(timestamp), 
        user_id,
        MAX(IF(action = 'page_load', timestamp, NULL)) AS ld,
        MIN(IF(action = 'page_exit', timestamp, NULL)) AS ex
    FROM facebook_web_log
    GROUP BY 1, 2
) t1
GROUP BY user_id
HAVING session_time IS NOT NULL