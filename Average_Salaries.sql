/* 
Compare each employee's salary with the average salary of the corresponding department.

Output the department, first name, and salary of employees along with 
the average salary of that department.

*/

SELECT 
department, 
first_name, 
salary, 
AVG(salary) OVER (PARTITION BY department)
FROM employee