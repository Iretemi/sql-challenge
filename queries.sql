CREATE TABLE "department" (
    "dept_no" varchar   NOT NULL,
    "dept_name" varchar   NOT NULL
);

CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar   NOT NULL,
    "from_date" varchar   NOT NULL,
    "to_date" varchar   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "birth_date" varchar   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "gender" varchar   NOT NULL,
    "hire_date" varchar   NOT NULL
);

CREATE TABLE "dept_manager" (
    "ddept_no" VARCHAR   NOT NULL,
    "emp_no" INT   NOT NULL,
    "from_date" varchar   NOT NULL,
    "to_date" varchar   NOT NULL
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" integer   NOT NULL,
    "from_date" varchar   NOT NULL,
    "to_date" varchar   NOT NULL
);

CREATE TABLE "titles" (
    "emp_no" INT   NOT NULL,
    "title" varchar   NOT NULL,
    "from_date" varchar   NOT NULL,
    "to_date" varchar   NOT NULL
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "department" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_ddept_no" FOREIGN KEY("ddept_no")
REFERENCES "department" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

-- List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, employees.last_name,employees.first_name, employees.gender, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

--List employees who were hired in 1987.
SELECT * FROM employees
WHERE hire_date LIKE '1987%';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT department.dept_no, department.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date
FROM department
JOIN dept_manager
ON department.dept_no = dept_manager.ddept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, department.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no=employees.emp_no 
JOIN department
ON dept_emp.dept_no = department.dept_no;

-- List all employees whose first name is "Duangkaew" and last names begin with "P."
SELECT * from employees 
where first_name ='Duangkaew' and last_name like 'P%' ;

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, department.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no=employees.emp_no 
JOIN department
ON dept_emp.dept_no = department.dept_no
WHERE department.dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, department.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no=employees.emp_no 
JOIN department
ON dept_emp.dept_no = department.dept_no
WHERE department.dept_name = 'Sales' or department.dept_name = 'Development';

-- In ascending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(*) 
FROM employees 
GROUP BY last_name
ORDER BY COUNT ASC;

