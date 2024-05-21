/*
Write a query that will calculate the number of shipments per month. 
The unique key for one shipment is a combination of shipment_id and sub_id. 

Output the year_month in format YYYY-MM and the number of shipments in that month.

*/

SELECT 
count(shipment_id),
date_format(shipment_date, '%Y-%m') date_ym
FROM amazon_shipment
GROUP BY date_ym