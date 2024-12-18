--Q1) Find total number of Orders per each day sort data based on highest Orders

SELECT order_date,count(order_date)
FROM sales_order
GROUP BY order_date
ORDER BY count(order_date) desc;

--Q2) Display total sales figure for each quarter ?
SELECT qtr_id
,case when qtr_id = 1 then 'JAN-MAR'
      when qtr_id = 2 then 'APR-JUN'
	  when qtr_id = 3 then 'JUL-SEP'
	  else 'OCT-DEC' end as Quarter_notation_range
,round(cast(sum(sales) as decimal), 2) as total_sales_per_quarter
FROM sales_order
GROUP BY qtr_id
ORDER BY total_sales_per_quarter desc;

--Q3) Identify how many cars,motorcycles,trains and ships are available in the inventory 
-- Treat all the types of car as 'Cars' only 

SELECT product_line,COUNT(product_line) as product_line 
FROM products
GROUP BY product_line
HAVING product_line in ('Motorcycles','Trains','Ships')
UNION ALL 
SELECT 'Cars',count(product_line)
FROM products
where lower(product_line) like '%cars%'

--Q4) Find the countries which have purchased more than 10 motorcycles ?

SELECT distinct country
FROM sales_order join customers on sales_order.customer = customers.customer_id
join products on sales_order.product = products.product_code
WHERE products.product_line = 'Motorcycles' and sales_order.quantity_ordered > 10;










