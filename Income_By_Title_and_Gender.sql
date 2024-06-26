/*
Find the average total compensation based on employee titles and gender. 
Total compensation is calculated by adding both the salary and bonus of each employee. 
However, not every employee receives a bonus so disregard employees without bonuses in your calculation. 
Employee can receive more than one bonus.

Output the employee title, gender (i.e., sex), along with the average total compensation.

Table sf_employee: 
id: int
first_name: varchar
last_name: varchar
age: int
sex: varchar
employee_title: varchar
department: varchar
salary: int
target: int
email: varchar
city: varchar
address: varchar
manager_id: int

Table sf_bonus: 
worker_ref_id: int
bonus: int
*/

SELECT 
e.employee_title,
e.sex,
AVG(e.salary + t.total) AS avg_total_copmensation
FROM sf_employee e
JOIN (
    SELECT worker_ref_id,
        SUM(bonus) AS total 
    FROM sf_bonus 
    GROUP BY worker_ref_id
) t 
ON e.id = t.worker_ref_id
GROUP BY e.employee_title, e.sex