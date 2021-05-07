-- Drop tabel if it exists
drop table titles;
--Create Title Table
create table titles(
	title_id varchar(30),
	title varchar,
	--primary table for all title_id
	primary key (title_id)
);
-- Check title table
select * from titles;

-- Drop employees table if already exists
drop table employees;
--Create employees table
create table employees(
	emp_no varchar(30),
	title_id varchar(30),
	birth_date date,
	first_name varchar,
	last_name varchar,
	sex varchar,
	hire_date date,
	-- primary table for employee number
	primary key (emp_no),
	-- sub table of titles
	FOREIGN KEY (title_id) REFERENCES titles(title_id)
);
-- Check if employees table imported correctly
select * from employees;
-- drop departments table if already exists
drop table departments;
-- create departments table
Create Table departments(
	dept_no varchar(30),
	dept_name varchar(30),
	-- Primary table for department numbers
	primary key (dept_no)
);
-- check to   see if  departments table imported correctly
select*from departments;
-- drop dept_emp table if already exists
drop table dept_emp; 
-- Create dept_emp table
create table dept_emp(
	emp_no varchar(30),
	dept_no varchar (30),
	--secondary table of employees
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	--secondary table of department
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
--check to sse if dept_emp imported correctly
select * from dept_emp;
-- drop dept_manager table if already exist
drop table dept_manager;
-- create dept_manage table
create table dept_manager(
	dept_no varchar(30),
	emp_no varchar(30),
	-- secondary table of employees
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	-- secondary table of departments
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
-- check to see if dept_manager table imported correctly
select * from dept_manager;
-- drop salarie table if already exists
drop table salaries;
--create salaries table
create table salaries(
	emp_no varchar(30),
	salary bigint,
	-- secondary table of employees 
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
-- check salaries to see if imported correctly
select * from salaries;