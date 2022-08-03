# adding sql queries as part of coding challenges

#Examples from W3Schools 
#From the following tables, write a SQL query to find the first name, last name, department number, and department name for each employee

select e.FIRST_NAME, e.LAST_NAME,e.DEPARTMENT_ID,d.DEPARTMENT_NAME from employees e INNER JOIN departments d WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID;


# LEFT OUTER JOIN 
# SELECT E.first_name AS "Employee Name",M.first_name AS "Manager" FROM employees E  LEFT OUTER JOIN employees M ON E.manager_id = M.employee_id;



# leetcode 
# find out the class with more than 5 students 
Input: 
Courses table:
+---------+----------+
| student | class    |
+---------+----------+
| A       | Math     |
| B       | English  |
| C       | Math     |
| D       | Biology  |
| E       | Math     |
| F       | Computer |
| G       | Math     |
| H       | Math     |
| I       | Math     |
+---------+----------+
Output: 
+---------+
| class   |
+---------+
| Math    |
+---------+

SELECT class
FROM Courses
GROUP BY class
Having COUNT(*) > 4;


# leetcode 
# find the customer with highest number of orders 
Input: 
Orders table:
+--------------+-----------------+
| order_number | customer_number |
+--------------+-----------------+
| 1            | 1               |
| 2            | 2               |
| 3            | 3               |
| 4            | 3               |
+--------------+-----------------+
Output: 
+-----------------+
| customer_number |
+-----------------+
| 3               |
+-----------------+


select customer_number from Orders group by order_number  order by order_number DESC limit 1;

