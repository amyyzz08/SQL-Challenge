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

