
USE employees_mod;

#2. Create a procedure that will provide the average salary of all employees.

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `avg_salary`()
BEGIN
            	SELECT       AVG(salary)
            	FROM       	t_salaries
END $$
DELIMITER;

#3. Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual, and returns their employee number.
CREATE DEFINER=`root`@`localhost` PROCEDURE `emp_info`(in p_first_name CHAR(255), in p_last_name CHAR(255), out p_emp_no integer)
BEGIN

SELECT
	e.emp_no
INTO p_emp_no FROM
	t_employees e
WHERE 
	e.first_name = p_first_name
			AND e.last_name = p_last_name;
END

#5. Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee, and returns the salary from the newest contract of that employee.
CREATE DEFINER=`root`@`localhost` FUNCTION `emp_info`(first_name varchar(100), last_name varchar(100)) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
DECLARE v_max_from_date date;
DECLARE v_salary decimal(10,2);
SELECT max(from_date) into v_max_from_date
from t_employees as e
join t_salaries as s
on s.emp_no=e.emp_no
where e.first_name=first_name and e.last_name=last_name;
SELECT s.salary into v_salary
from t_employees e
join t_salaries s
on s.emp_no=e.emp_no
where e.first_name=first_name and e.last_name=last_name and s.from_date = v_max_from_date;
RETURN v_salary;
END


#6. Create a trigger that checks if the hire date of an employee is higher than the current date. If true, set this date to be the current date. Format the output appropriately (YY-MM-DD)
DROP TRIGGER IF EXISTS trig_hire_date;

DELIMITER $$

CREATE TRIGGER trig_hire_date
BEFORE INSERT ON t_employees
FOR EACH ROW
BEGIN
	IF NEW.hire_date > date_format(sysdate(), '%Y-%m-%d') THEN
		SET NEW.hire_date = date_format(sysdate(), '%Y-%m-%d');
	END IF;
END $$

DELIMITER ; 

# Test trig_hire_date

INSERT INTO t_employees VALUES ('999904', '1970-01-31', 'John', 'Johnson', 'M', '2025-01-01');

SELECT * FROM t_employees ORDER BY emp_no DESC;

#7. Create ‘i_hire_date’ and Drop the ‘i_hire_date’ index.

SELECT * FROM t_employees WHERE hire_date > '2000-01-01';
CREATE INDEX i_hire_date ON t_employees(hire_date);
select * from t_employees;
# Drop i_hire_date index
ALTER TABLE t_employees
DROP INDEX i_hire_date;


#8. Select all records from the ‘salaries’ table of people whose salary is higher than $89,000 per annum.

SELECT * FROM t_salaries s WHERE salary > 89000;

CREATE INDEX i_salary ON t_salaries(salary);

#9. Use Case statement and obtain a result set containing the employee number, first name, and last name of all employees with a number higher than 109990. Create a fourth column in the query, indicating whether this employee is also a manager, according to the data provided in the dept_manager table, or a regular employee. 

select e.emp_no, e.first_name, e.last_name,
case
when dm.emp_no is not null then 'Manager'
else 'Employee'
end
from t_dept_manager dm
join t_employees e
on e.emp_no=dm.emp_no
where e. emp_no>109990;

#10. Extract a dataset containing the following information about the managers: employee number, first name, and last name. Add two columns at the end – one showing the difference between the maximum and minimum salary of that employee, and another one saying whether this salary raise was higher than $30,000 or NOT.

select dm.emp_no, e.first_name, e.last_name, max(s.salary) - min(s.salary) as salary_difference,
if(max(s.salary) - min(s.salary) > 30000, 'Salary raise was higher than $30,000', 'Salary raise was not higher than $30,000')
as salary_increase
from t_dept_manager dm
join t_employees e on  e.emp_no=dm.emp_no
join t_salaries s on dm.emp_no=s.emp_no
GROUP BY s.emp_no;

#11. Extract the employee number, first name, and last name of the first 100 employees, and add a fourth column, called “current_employee” saying “Is still employed” if the employee is still working in the company, or “Not an employee anymore” if they aren’t. Hint: You’ll need to use data from both the ‘employees’ and the ‘dept_emp’ table to solve this exercise. 
select e.emp_no, e.first_name, e.last_name,
case 
when max(em.to_date)>DATE_FORMAT(SYSDATE(), '%Y-%m-%d') then 'Is still employed'
else 'Not an employee anymore'
end
from t_dept_emp em
join t_employees e
on e.emp_no=em.emp_no
group by em.emp_no
limit 100;

	
