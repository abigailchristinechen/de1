-- DE DAY 4 September 29, 2021

-- Topic Questions
-- How do you design/model a database?
-- In normalized database, the data is structured in a way to avoid data redundancy and support consistency. 
-- As analyst, this structure is not always the best fit for analytics. How do you merge one or more tables to get the required data set?

-- Objectives
-- Understanding the basics of data modelling
-- Practicing data modelling
-- Introducing a larger relational database
-- Understanding the difference between different joins
-- Present examples and exercise joins

-- Keywords
#DATA MODELLING
#RELATIONAL DATASETS
#JOINS

-- INNER join format 
SELECT *
FROM left_table
INNER JOIN right_table
ON left_table.id = right_table.id;

USE classicmodels;

-- join all fields of products and productlines details
SELECT * 
FROM products 
INNER JOIN productlines  
ON products.productline = productlines.productline;

-- Same thing with aliasing:
SELECT *
FROM products t1
INNER JOIN productlines t2 
ON t1.productline = t2.productline;

-- can also add 'as'
SELECT *
FROM products AS t1
INNER JOIN productlines AS t2 
ON t1.productline = t2.productline; 

-- same thing, but now with USING:
SELECT *
FROM products 
INNER JOIN productlines 
USING(productline);

-- specific columns
SELECT t1.productName, t1.productLine, t2.textDescription
FROM products t1
INNER JOIN productlines t2 
ON t1.productline = t2.productline;

-- Exercise #1 : Join all fields of order and orderdetails
SELECT * 
FROM orders AS o1
INNER JOIN orderdetails AS o2
ON o1.orderNumber = o2.orderNumber;

-- Exercise #2 : Join all fields of order and orderdetails. 
-- Display only orderNumber, status and sum of totalsales (quantityOrdered * priceEach) for each orderNumber.
SELECT 
	t1.orderNumber,
    t1.status,
    SUM(QuantityOrdered * priceEach) AS totalsales
FROM
	orders AS t1
INNER JOIN orderdetails AS t2
	ON t1.orderNumber = t2.orderNumber
GROUP BY 
	orderNumber;
 
SELECT 
	orders.orderNumber,
    orders.status,
    SUM(QuantityOrdered * priceEach) AS totalsales
FROM 
	orders
INNER JOIN orderdetails
	ON orders.orderNumber = orderdetails.orderNumber
GROUP BY orderNumber;

-- multiple inner join 
SELECT *
FROM left_table
INNER JOIN right_table
ON left_table.id = right_table.id
INNER JOIN another_table
ON left_table.id = another_table.id;
 
 -- Exercise #3: We want to know how the employees are performing. 
 -- Join orders, customers and employees and return orderDate,lastName, firstName
SELECT 
	orders.orderDate,
	lastName,
	firstName,
	salesRepEmployeeNumber,
    -- ROUND(COUNT(status)/(COUNT(orderNumber))* 100) AS totalOrder,
    -- COUNT(salesRepEmployeeNumber) AS employeeCount,
    -- COUNT(Status) AS statusCount,
    status
FROM 
	orders
INNER JOIN 
	customers
ON 
	orders.customerNumber = customers.customerNumber
INNER JOIN 
	employees
ON 
	customers.salesRepEmployeeNumber = employees.employeeNumber
GROUP BY 
	status, salesRepEmployeeNumber;


SELECT 
orders.orderNumber,
priceEach,
quantityOrdered,
productName,
productLine,
customers.city,
country,
orderDate
FROM 
	orders
INNER JOIN 
	orderdetails
ON 
	orders.orderNumber = orderdetails.orderNumber
INNER JOIN 
	products
ON 
	orderdetails.productCode = products.productCode
INNER JOIN
	customers
ON 
	orders.customerNumber = customers.customerNumber;

-- GROUP BY 
	-- status, salesRepEmployeeNumber;








