--Q1) Find the average sales order price based on deal size

select * from Customers;
Select * from Sales_order;
select * from Products;

select distinct quantity_ordered from Sales_order;

SELECT AVG(sales) as avg_sales,deal_size
FROM Sales_order
GROUP BY deal_size;

--Q2)Identify the vehicles in the inventory which are short in number.
--Shortage of vehicle is considered when there are less than 10 vehicles.

SELECT product_line,count(product_line)
FROM Products
GROUP BY product_line
HAVING count(product_line) < 10
Order by 2;

-- Diff btw WHERE and HAVING:
-- WHERE is used to filter data returned from a table/view/resultset
-- HAVING is used to filter data returned from a GROUP BY

--4) Identify how many cars, Motorcycles, trains and ships are available in the inventory.
--Treat all type of cars as just "Cars".

SELECT * FROM Products;



