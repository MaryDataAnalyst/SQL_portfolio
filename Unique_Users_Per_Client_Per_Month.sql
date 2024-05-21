/*
Write a query that returns the number of unique users per client per month. 
*/

SELECT 
client_id,
date_format(time_id, '%m') AS month,
count(DISTINCT user_id)
FROM fact_events
GROUP BY client_id, month
ORDER BY client_id, month