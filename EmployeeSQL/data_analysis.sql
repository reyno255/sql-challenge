-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no as "Employee No.", last_name as "Last Name", first_name as "First Name", 
		sex as "Gender", salary as "Salary"
FROM employees 
INNER JOIN salaries ON (employees.emp_no = salaries.emp_no);

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name as "First Name", last_name as "Last Name", hire_date as "Hire Date"
FROM employees
WHERE EXTRACT(YEAR FROM DATE(hire_date)) = 1986

-- 3. List the manager of each department with the following information: department number, 
--    department name, the manager's employee number, last name, first name.
SELECT departments.dept_no AS "Dept No.", dept_name AS "Dept Name", employees.emp_no AS "Mgr. Employee No.", 
		last_name AS "Last Name", first_name AS "First Name"
FROM employees
INNER JOIN dept_manager ON (employees.emp_no = dept_manager.emp_no)
INNER JOIN departments ON (dept_manager.dept_no = departments.dept_no)


-- 4. List the department of each employee with the following information: employee number, 
--    last name, first name, and department name.
SELECT employees.emp_no AS "Employee No.", last_name AS "Last Name", first_name AS "First Name", dept_name AS "Dept."
FROM employees
INNER JOIN dept_emp ON (employees.emp_no = dept_emp.emp_no)
INNER JOIN departments ON (dept_emp.dept_no = departments.dept_no)

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and 
--    last names begin with "B."
SELECT first_name as "First Name", last_name as "Last Name", sex as "Gender"
FROM employees
WHERE first_name = 'Hercules' AND LEFT(last_name, 1) = 'B'

-- 6. List all employees in the Sales department, including their employee number, last name, 
-- first name, and department name.
SELECT employees.emp_no AS "Employee No.", last_name AS "Last Name", first_name AS "First Name", dept_name AS "Dept."
FROM employees
INNER JOIN dept_emp ON (employees.emp_no = dept_emp.emp_no)
INNER JOIN departments ON (dept_emp.dept_no = departments.dept_no)
WHERE dept_name = 'Sales'

-- 7. List all employees in the Sales and Development departments, including their employee number, 
--    last name, first name, and department name.
SELECT employees.emp_no AS "Employee No.", last_name AS "Last Name", first_name AS "First Name", dept_name AS "Dept."
FROM employees
INNER JOIN dept_emp ON (employees.emp_no = dept_emp.emp_no)
INNER JOIN departments ON (dept_emp.dept_no = departments.dept_no)
WHERE dept_name = 'Sales' 
OR dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., 
--    how many employees share each last name.
SELECT last_name AS "Last Name", COUNT(last_name) AS "Count Last Names"
FROM employees
GROUP BY "Last Name"
ORDER BY "Count Last Names" DESC;