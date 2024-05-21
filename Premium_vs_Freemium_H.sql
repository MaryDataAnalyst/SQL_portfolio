/*
Find the total number of downloads for paying and non-paying users by date. 
Include only records where non-paying customers have more downloads than paying customers. 

The output should be sorted by earliest date first and contain 3 columns date, non-paying downloads, paying downloads.

Table ms_user_dimension:
user_id: int
acc_id: int

Table ms_acc_dimension:
acc_id: int
paying_customer: varchar

Table ms_download_facts:
date: datetime
user_id: int
downloads: int
*/

SELECT 
date,
non_paying_downloads,
paying_downloads 
FROM ( 
SELECT 
        date, 
        sum(CASE WHEN paying_customer = 'no' THEN downloads END) AS non_paying_downloads,
        sum(CASE WHEN paying_customer = 'yes' THEN downloads END ) AS paying_downloads
FROM ms_user_dimension ud
INNER JOIN ms_acc_dimension ad ON ud.acc_id = ad.acc_id
INNER JOIN ms_download_facts df ON ud.user_id = df.user_id
GROUP BY date
ORDER BY date
) t
WHERE (non_paying_downloads - paying_downloads) > 0
ORDER BY t.date