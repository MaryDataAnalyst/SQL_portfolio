SELECT 
date_format(created_at, '%Y-%m') as date,
ROUND((sum(value) - lag(sum(value)) OVER())/lag(sum(value)) over() * 100, 2) as diff
FROM sf_transactions
GROUP BY date
ORDER BY date