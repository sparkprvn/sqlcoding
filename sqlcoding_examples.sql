# adding sql queries as part of coding challenges

#Examples from W3Schools 
#From the following tables, write a SQL query to find the first name, last name, department number, and department name for each employee

select e.FIRST_NAME, e.LAST_NAME,e.DEPARTMENT_ID,d.DEPARTMENT_NAME from employees e INNER JOIN departments d WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID;


# LEFT OUTER JOIN 
# SELECT E.first_name AS "Employee Name",M.first_name AS "Manager" FROM employees E  LEFT OUTER JOIN employees M ON E.manager_id = M.employee_id;
