--Check to see if all tables display correctly0
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT ep.emp_no, ep.last_name, ep.first_name, ep.sex, s.salary
FROM employees ep
	JOIN salaries s
		ON ep.emp_no = s.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE
	hire_date LIKE '%86';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, dm.emp_no, ep.last_name, ep.first_name 
FROM dept_manager dm
	JOIN employees ep 
		ON dm.emp_no = ep.emp_no
	JOIN departments d 
		ON dm.dept_no = d.dept_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT ep.emp_no, ep.last_name, ep.first_name, d.dept_name
FROM employees ep
	JOIN dept_emp de
		ON ep.emp_no = de.emp_no
	JOIN departments d
		ON de.dept_no = d.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT ep.emp_no, ep.last_name, ep.first_name, d.dept_name
FROM employees ep
	JOIN dept_emp de
		ON ep.emp_no = de.emp_no
	JOIN departments d
		ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT ep.emp_no, ep.last_name, ep.first_name, d.dept_name
FROM employees ep
	JOIN dept_emp de
		ON ep.emp_no = de.emp_no
	JOIN departments d
		ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
	OR d.dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT ep.last_name, COUNT(ep.last_name) AS frequency_count
FROM employees ep
GROUP BY ep.last_name
ORDER BY frequency_count DESC;