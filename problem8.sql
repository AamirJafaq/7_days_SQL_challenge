-- Given table employees.
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50),
    salary DECIMAL(10, 2),
    department VARCHAR(20),
    manager_id INT
	

/* Interview Questions
Q.1 Find the highest salary employee in each department.
*/
-- Solution
SELECT * 
FROM (SELECT department, employee_name, salary, 
	DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank 
FROM employees)
WHERE rank=1;


/* Q.2 Find employees who earn more than their manager.
*/
-- Solution
SELECT e1.employee_name, e1.salary AS employee_salary,
			e2.employee_name AS manager_name, e2.salary AS manager_salary 
FROM employees AS e1
JOIN employees AS e2 ON e1.manager_id=e2.employee_id
WHERE e1.salary> e2.salary;


/* Q.3 Find the total numbers of employees in each department.
*/
-- Solution
SELECT department, count(employee_id) AS total_employees 
FROM employees
GROUP BY department;


/* Q.4 Find employees whose salary is above the average salary of their department.
*/ 
-- Solution
SELECT department, ROUND(avg(salary))
FROM employees
GROUP BY department;

SELECT employee_name, department, employee_salary 
FROM (SELECT employee_name, department, salary AS employee_salary, 
		AVG(salary) OVER(PARTITION BY department) AS department_avg_salary
FROM employees)
WHERE employee_salary> department_avg_salary


/* Q.5 Show department-wise total salary and manager name.
*/
-- Solution
WITH q AS (SELECT department, sum(salary) AS dpt_total_salary
FROM employees
GROUP BY 1)
SELECT q.*, e.employee_name AS manager_name
FROM q
LEFT JOIN employees AS e ON q.department=e.department AND e.manager_id IS NULL
