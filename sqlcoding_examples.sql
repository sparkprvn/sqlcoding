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

# leet code 
Table: SalesPerson

+-----------------+---------+
| Column Name     | Type    |
+-----------------+---------+
| sales_id        | int     |
| name            | varchar |
| salary          | int     |
| commission_rate | int     |
| hire_date       | date    |
+-----------------+---------+
sales_id is the primary key column for this table.
Each row of this table indicates the name and the ID of a salesperson alongside their salary, commission rate, and hire date.
 

Table: Company

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| com_id      | int     |
| name        | varchar |
| city        | varchar |
+-------------+---------+
com_id is the primary key column for this table.
Each row of this table indicates the name and the ID of a company and the city in which the company is located.
 

Table: Orders

+-------------+------+
| Column Name | Type |
+-------------+------+
| order_id    | int  |
| order_date  | date |
| com_id      | int  |
| sales_id    | int  |
| amount      | int  |
+-------------+------+
order_id is the primary key column for this table.
com_id is a foreign key to com_id from the Company table.
sales_id is a foreign key to sales_id from the SalesPerson table.
Each row of this table contains information about one order. This includes the ID of the company, the ID of the salesperson, the date of the order, and the amount paid.
 

Write an SQL query to report the names of all the salespersons who did not have any orders related to the company with the name "RED".

Return the result table in any order.

select distinct name 
from SalesPerson  
where name not in 
(select distinct S.name 
from SalesPerson S, Orders O, Company C
where C.name = "RED" and O.com_id = C.com_id and S.sales_id = O.sales_id)


