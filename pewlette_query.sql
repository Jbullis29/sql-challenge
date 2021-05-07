-- Creating a query from with a join that will list employee details with salary
-- to do this I joined employee inforfrom table with the salaries from the salaries table
-- Selecting my columns
select employees.emp_no, 
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
--from the table I want to merge from
from employees
-- to the table I want to join on 
inner join salaries on
employees.emp_no = salaries.emp_no;


-- New query to find information on employees hired in 19886
-- no merge need just selecting information from employees table
select first_name, 
	last_name,
	hire_date
from employees 
-- Found out the date variable saves the dates as an int so great than and less than can be used
-- soorted by all dates greater than jan 1st to december 31st 1985 
where hire_date >= '01-01-1986'
and hire_date <='12-31-1986'; 

-- Referencing 3 table I mmight want to use and also combine
select* from dept_manager;
select * from employees;
select* from departments;
-- in subsequent lines I creat a new table. This line dropes table if you need to adjust code
drop table manager_table;
-- selecting all my columns from employees and dept_manager to get manager names
-- selected department number column to murge department names in the future
select employees.first_name,
	employees.last_name,
	employees.emp_no,
	dept_manager.dept_no
-- This simple function saves my merge as a new table called manager table. (super awesome) 
into manager_table
from employees
inner join dept_manager on 
employees.emp_no = dept_manager.emp_no;
--Exploring my newly created table
select * from manager_table;

-- Now that the new table has manager daprtment numbers 
-- I can merge it with deprtments table to get department names for each manager
select manager_table.first_name,
	manager_table.last_name,
	manager_table.emp_no,
	manager_table.dept_no,
	departments.dept_name
from manager_table
-- right join cause I wanted my data from the new toble to join my current table
right join departments on 
manager_table.dept_no = departments.dept_no;
-- Exploring my dept_emp table to find out what collumns will match
select * from dept_emp;

--dropping new table incase we need to add to it
drop table updated_dept_emp;

-- Merging again to creat a new table for ease of answering future questions
-- This logically made sense to me cause the relvant info is on different tables
-- so I combine them to make one table with all relevant info
select employees.first_name,
	employees.last_name,
	employees.emp_no,
	dept_emp.dept_no,
	departments.dept_name
into updated_dept_emp
-- named it revision 1 to signify it will be updated again
from dept_emp
--left join cause I went my new information to join the table i selected form
inner join employees on dept_emp.emp_no = employees.emp_no
inner join departments on dept_emp.dept_no = departments.dept_no;

-- Exploring my new updated employee department table
select * from updated_dept_emp;

-- Because I created the new employees table the rest of the queries just required some simple logic
-- since all the data is included in my new table 
select first_name,
	last_name,
	sex
from employees 
-- serching for the name hercules
where first_name = 'Hercules'
-- and any last name beggining with the letter B. I used like pand then the wild card symbol
and last_name like 'B%';

-- querying my new table to get information on anyone in sales
select first_name,
	last_name,
	emp_no,
	dept_no,
	dept_name
from updated_dept_emp
where dept_name ='Sales';

-- Now querying to get inormation on anyone in sales or development departments
select first_name,
	last_name,
	emp_no,
	dept_no,
	dept_name
from updated_dept_emp
where dept_name ='Sales'
or dept_name = 'Development';


-- Finally querying to get the count of employees who share the same last name
-- used the count function to count all the last names that are the same
select last_name, count(last_name) as "count_with_name"
from employees
-- In order for count to work you have to croup the data by what you want it to count
group by last_name
-- Order by function sorts the data in the column of your chosing
order by count_with_name desc;


