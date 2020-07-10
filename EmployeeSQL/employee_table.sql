-- Drop table if exists
-- DROP TABLE IF EXISTS salaries;
-- DROP TABLE IF EXISTS dept_manager;
-- DROP TABLE IF EXISTS employees;
-- DROP TABLE IF EXISTS dept_emp;
-- DROP TABLE IF EXISTS titles;
-- DROP TABLE IF EXISTS departments;

-- Create table and view column datatypes
CREATE TABLE departments (
	dept_no VARCHAR(255) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(255) NOT NULL
);

CREATE TABLE titles (
	title_id VARCHAR(255) PRIMARY KEY NOT NULL,
	title VARCHAR(255) NOT NULL
);

CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR(255) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE employees (
	emp_no INT,
	emp_title VARCHAR(255) NOT NULL,
	birth_date VARCHAR(255) NOT NULL,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	sex VARCHAR(255) NOT NULL,
	hire_date VARCHAR(255) NOT NULL,
	FOREIGN KEY (emp_title) REFERENCES titles(title_id),
	PRIMARY KEY (emp_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(255) NOT NULL,
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE salaries (
	emp_no INT,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (emp_no)
);

--Import all csv
--Run tables
SELECT *
FROM departments;
SELECT *
FROM dept_emp;
SELECT *
FROM dept_manager;
SELECT *
FROM employees;
SELECT *
FROM salaries;
SELECT *
FROM titles;