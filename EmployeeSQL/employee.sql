--DATA ENGINEERING

--Departments Table
DROP TABLE departments
CREATE TABLE departments(
	dept_no VARCHAR NOT NULL ,
	department VARCHAR NOT NULL,
	PRIMARY KEY (dept_no))
SELECT * FROM departments

--Employee Table
DROP TABLE employees
CREATE TABLE employees(
	emp_no INTEGER NOT NULL,
	emp_title VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no))
SELECT * FROM employees

--Department/Employee Table
DROP TABLE dept_emp
CREATE TABLE dept_emp(
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR NOT NULL,
	PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no))
SELECT * FROM dept_emp

--Salary Table
DROP TABLE salaries
CREATE TABLE salaries(
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no))
SELECT * FROM salaries

--Department Manager Table
DROP TABLE dept_manager
CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no))
SELECT * FROM dept_manager

--Title Table
DROP TABLE titles
CREATE TABLE titles(
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	PRIMARY KEY (title_id))
SELECT * FROM titles




