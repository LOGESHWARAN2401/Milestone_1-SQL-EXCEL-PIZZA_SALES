select * from pizza_sales

select sum(total_price) as total_revenue from pizza_sales ;

select sum(total_price) / count(distinct order_id) as aveg_order_id from pizza_sales;

alter table pizza_sales
alter column quantity int;

SELECT SUM (quantity)AS TOTA_PIZZA_SOLD FROM pizza_sales;

select count (distinct order_id) as Total_order from pizza_sales ;

select cast(cast(sum (quantity) as decimal(10,2)) /
cast(count(distinct(order_id) )As decimal(10,2))  As decimal(10,2)) As avg_pizza_per_order from pizza_sales;

select DATENAME(dw,order_date) as order_day , count(distinct order_id) as total_order
from pizza_sales 
group by datename(dw,order_date) 

select datepart(HOUR,order_time) as order_hours , count(distinct order_id) as total_order
from pizza_sales 
group by datepart(HOUR,order_time) 
ORDER BY datepart(hour,order_time)

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC

commit transaction ;