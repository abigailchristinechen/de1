-- DE DAY7 October 11, 2021

USE classicmodels;

SELECT 
	orders.orderNumber AS SalesId,
	orderdetails.priceEach AS Price,
    orderdetails.quantityOrdered AS Unit,
    orders.orderDate AS Date,
    WEEK(orders.orderDate) AS WeekOfYear
FROM 
	orders
INNER JOIN
	orderdetails USING (orderNumber);

SELECT 
	orders.orderNumber AS SalesId,
	orderdetails.priceEach AS Price,
    orderdetails.quantityOrdered AS Unit,
    orders.orderDate AS Date,
    WEEK(orders.orderDate) AS WeekOfYear,
    products.productName AS Product,
    products.productLine AS Brand
FROM 
	orders
INNER JOIN 
	orderdetails USING (orderNumber)
INNER JOIN
	products USING (productCode);
    

SELECT 
	orders.orderNumber AS SalesId,
	orderdetails.priceEach AS Price,
    orderdetails.quantityOrdered AS Unit,
    orders.orderDate AS Date,
    WEEK(orders.orderDate) AS WeekOfYear,
    products.productName AS Product,
    products.productLine AS Brand,
	customers.city AS City,
    customers.country AS Country
FROM 
	orders
INNER JOIN 
	orderdetails USING (orderNumber)
INNER JOIN
	products USING (productCode)
INNER JOIN
    customers USING (customerNumber);
    

DROP PROCEDURE IF EXISTS CreateProductSalesStore;

DELIMITER //

CREATE PROCEDURE CreateProductSalesStore()
BEGIN

	DROP TABLE IF EXISTS product_sales;

	CREATE TABLE product_sales AS
	SELECT 
	   orders.orderNumber AS SalesId, 
	   orderdetails.priceEach AS Price, 
	   orderdetails.quantityOrdered AS Unit,
	   products.productName AS Product,
	   products.productLine As Brand,   
	   customers.city As City,
	   customers.country As Country,   
	   orders.orderDate AS Date,
	   WEEK(orders.orderDate) as WeekOfYear
	FROM
		orders
	INNER JOIN
		orderdetails USING (orderNumber)
	INNER JOIN
		products USING (productCode)
	INNER JOIN
		customers USING (customerNumber)
	ORDER BY 
		orderNumber, 
		orderLineNumber;

END //
DELIMITER ;


CALL CreateProductSalesStore();





    






