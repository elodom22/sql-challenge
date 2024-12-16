create table titles(
	titles_id VARCHAR PRIMARY KEY,
	title VARCHAR NOT NULL
);

create table departments(
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR
);

create table employees(
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR NOT NULL
	birth_date VARHCAR NOT NULL
	first_name VARHCAR NOT NULL
	last_name VARHCAR NOT NULL
	sex VARHCAR NOT NULL
	hire_date VARHCAR NOT NULL
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- dept_emp == many-many relationship >> need primary keys 
create table dept_emp(
	emp_no INT NOT NULL
	dept_no VARHCAR NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

create table salaries(
	emp_no INT PRIMARY KEY
	salaray INT NOT NULL
	FOREIGN KEY (emp_no) REFERENCES employess(emp_no)
);

-- dept_manager == many-many relationship >> need primary keys
create table dept_manager(
	dept_no VARCHAR NOT NULL
	emp_no INT NOT NULL
	PRIMARY KEY (dept_no, emp_no)
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
	FOREIGN KEY (emp)no) REFERENCES employees(emp_no)
);

--1.List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaraies.emp_no;

--2.List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

--3.List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
JOIN departments ON dept_manager.dept_no = departments.dept_no
JOIN employees ON dept_mangaer.emp_no = employees.emp_no

--4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first.name, departments.dept_name
FROM emplpoyees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN dept_no ON dept_emp.dept_no = departments.dept_no;

--5.List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Herucles' and last_name LIKE '%B';

--6.List each employee in the Sales department, including their employee number, last name, and first name.
	-- Sales dept = d007
	--do i need to import dept_name here???
SELECT * FROM departments
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_no = 'd007';

--7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
	-- dev = d005, Sales dept = d007 
SELECT * FROM departments
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_no = 'd005' or WHERE departments.dept_no = 'd007'; 

--8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name, COUNT(last_name) AS "Frequency Counts"
FROM employees
GROUP BY last_name
ORDER BY "Frequency Counts" DESC;