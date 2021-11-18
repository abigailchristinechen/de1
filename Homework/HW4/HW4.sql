-- HW #4

-- INNER join orders,orderdetails,products and customers. Return back:

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



-- Exercise #1 : Join all fields of order and orderdetails
SELECT * 
FROM orders AS o1
INNER JOIN orderdetails AS o2
ON o1.orderNumber = o2.orderNumber;

-- Exercise #2 : Join all fields of order and orderdetails. 
-- Display only orderNumber, status and sum of totalsales (quantityOrdered * priceEach) for each orderNumber.
SELECT 
	orders.orderNumber,
    orders.status,
    SUM(QuantityOrdered * priceEach) AS totalsales
FROM 
	orders
INNER JOIN orderdetails
	ON orders.orderNumber = orderdetails.orderNumber
GROUP BY orderNumber;

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





