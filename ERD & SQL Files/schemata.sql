DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

CREATE TABLE departments (
    dept_no VARCHAR NOT NULL PRIMARY KEY,
    dept_name VARCHAR NOT NULL
);

select * from departments;

CREATE TABLE dept_emp (
	id SERIAL PRIMARY KEY,
    emp_no INT NOT NULL,
    dept_no VARCHAR NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

select * from dept_emp;


CREATE TABLE dept_manager (
	id SERIAL PRIMARY KEY,
    dept_no VARCHAR NOT NULL,
    emp_no INT NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

select * from dept_manager; 

CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    sex VARCHAR NOT NULL,
    hire_date DATE NOT NULL
);

select * from employees;

CREATE TABLE salaries (
	id SERIAL PRIMARY KEY,
    emp_no INT NOT NULL,
    salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

select * from salaries;

CREATE TABLE titles (
    title_id VARCHAR NOT NULL PRIMARY KEY,
    title VARCHAR NOT NULL
);

select * from titles


ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES titles (title_id);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);


