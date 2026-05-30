-- Beginner SQL Practice
--
-- This project contains SQL exercises focused on:
-- SELECT, WHERE, ORDER BY, GROUP BY,
-- JOINs and Aggregations.
--
-- Sample tables:
-- employees
-- salaries

--Show all employees
SELECT * FROM employees;

--Show only first and last names of employees
SELECT first_name, last_name 
FROM employees;

--Show employees who are from Denmark
SELECT first_name, last_name
 FROM employees
 WHERE country = 'Denmark';

--Show employees who are in the IT department
 SELECT first_name, last_name
    FROM employees
    WHERE department = 'IT';

--sort employees by first name
SELECT concat(first_name, ' ', last_name) AS full_name
FROM employees
order by first_name;

--total number of employees in each department
SELECT department, COUNT(*) AS num_employees
FROM employees
GROUP BY department;

--average salary of employees in each country
SELECT country, AVG(salary) AS avg_salary
FROM employees
GROUP BY country;

--total salary paid to employees in each department
SELECT department, sum(salary) AS total_salary
FROM employees
GROUP BY department;

--employee with the highest salary
SELECT first_name, last_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 1;

--employees with salary greater than 5000, sorted by salary in descending order
select first_name, last_name, salary
from employees
where salary > 5000
order by salary desc;


--employees who are not from Denmark
SELECT first_name, last_name, country
FROM employees
where country<> 'denmark';

--employees in the IT or HR department
Select concat(first_name,' ', last_name) as full_name, salary
from employees
where department IN('IT', 'HR');

--using inner join to show employee names and their salaries
select concat(e.first_name, ' ', e.last_name) as employee_name, s.salary
from employees e
join salaries s
on e.employee_id = s.employee_id;

--using left join to show all employees and their salaries, filtering and showwing employees without a salary record
select concat(e.first_name, ' ', e.last_name) as employee_name, s.salary
from employees e
left join salaries s
on e.employee_id = s.employee_id
where s.salary is null;

--using group by to show the number of employees and total salary in each department
select e.department, count(*) as num_employees, sum(s.salary) as total_salary
from employees e
join salaries s
on e.employee_id = s.employee_id
group by e.department;




