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


  --DATA ANALYSIS
 
 --1.List the following details of each employee:
 --employee number, last name, first name, sex, and salary
Select e.emp_no,e.last_name, e.first_name, e.sex, s.salary
From employees AS e
Inner join salaries AS s ON
e.emp_no =s.emp_no
 
--2.List first name, last name, and hire date for employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE 
EXTRACT(YEAR FROM hire_date) = '1986'
 
--3.List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name
SELECT d.dept_no, d.department, e.emp_no, e.first_name, e.last_name
FROM departments AS d
JOIN dept_manager AS dm
ON d.dept_no= dm.dept_no
JOIN employees AS e
ON dm.emp_no= e.emp_no

--4.List the department of each employee with the following information: 
--employee number, last name, first name, and department name
SELECT d.dept_no, d.department, e.emp_no, e.first_name, e.last_name
FROM departments AS d
JOIN dept_emp AS de
ON d.dept_no= de.dept_no
JOIN employees AS e
ON de.emp_no= e.emp_no  

--5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name='Hercules' and last_name LIKE 'B%'
 
--6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT emp_no, last_name, first_name
FROM employees
WHERE emp_no IN
	
	(SELECT emp_no
	 FROM dept_emp
	 WHERE dept_no IN
	 	
	 	(SELECT dept_no
		 FROM departments
		 WHERE department='Sales'
		)
	)

--7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT emp_no, last_name, first_name
FROM employees
WHERE emp_no IN
	
	(SELECT emp_no
	 FROM dept_emp
	 WHERE dept_no IN
	 	
	 	(SELECT dept_no
		 FROM departments
		 WHERE department='Sales'
		)
	)

UNION

SELECT emp_no, last_name, first_name
FROM employees
WHERE emp_no IN
	
	(SELECT emp_no
	 FROM dept_emp
	 WHERE dept_no IN
	 	
	 	(SELECT dept_no
		 FROM departments
		 WHERE department='Development'
		)
	)

--8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name
SELECT last_name, COUNT(last_name) AS "Count of Shared Last Names"
FROM employees
GROUP BY last_name
ORDER BY "Count of Shared Last Names" DESC

