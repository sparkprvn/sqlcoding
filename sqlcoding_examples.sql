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
select customer_number
from orders
group by customer_number
order by count(*) desc limit 1


# leetcode 
Table: Product

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| product_id   | int     |
| product_name | varchar |
| unit_price   | int     |
+--------------+---------+
product_id is the primary key of this table.
Each row of this table indicates the name and the price of each product.
Table: Sales

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| seller_id   | int     |
| product_id  | int     |
| buyer_id    | int     |
| sale_date   | date    |
| quantity    | int     |
| price       | int     |
+-------------+---------+
This table has no primary key, it can have repeated rows.
product_id is a foreign key to the Product table.
Each row of this table contains some information about one sale.
 

Write an SQL query that reports the products that were only sold in the first quarter of 2019. That is, between 2019-01-01 and 2019-03-31 inclusive.

select distinct p1.product_id, p1.product_name
from Product p1, Sales s1
where p1.product_id not in(
select product_id
from Sales
where sale_date not between '2019-01-01' and '2019-03-31')
and p1.product_id = s1.product_id
