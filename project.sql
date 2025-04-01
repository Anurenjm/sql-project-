-- EMPLOYEES TABLE 

SELECT * FROM employees;

-- Employee Name (Employee ID: 101)
select first_name from employees where employee_id=101;

-- Employees with Salary Greater Than 50,000
select first_name from employees where salary>50000;

-- Employees Hired Before or Exactly 3 Years Ago
select first_name,hire_date from employees where hire_date<=date_sub(curdate(),interval 3 year);

-- Employees Sorted by Hire Date (Oldest to Newest)
select * from employees order by hire_date asc;

-- Employees Whose Last Name Starts with 'J' 
SELECT * FROM employees WHERE last_name LIKE 'J%';

-- Increase Salary by 10% for Employees Hired More Than 3 Years Ago
update employees set salary=salary*0.10 where hire_date<=date_sub(curdate(),interval 3 year);

-- Employees Earning Above or Equal to the Average Salary
select first_name,salary from employees where salary >=(select avg(salary) from employees);

-- Function to Calculate Tax Based on Salary Bracket
delimiter $$
create function highertax(salary decimal(20,2))
returns decimal(20,2)
deterministic
begin 
declare tax decimal(20,2);
if salary<5000 then
set tax=0;
elseif salary between 5000 and 7000 then
set tax=salary*0.10;
else 
set tax=salary * 0.20;
end if;
return tax;
end$$
delimiter ;

select highertax(6090) as tax;
 



