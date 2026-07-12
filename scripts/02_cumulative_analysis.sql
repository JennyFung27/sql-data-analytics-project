/*Cumulative Analysis--calculate the total sales per month 
and the running total of sales over time*/
SELECT
    order_date,
    total_sales,
    sum(total_sales) over (ORDER BY order_date) running_total_sales
FROM (

SELECT
    DATETRUNC(month, order_date) order_date,
    SUM(sales_amount) total_sales
FROM gold.fact_sales
WHERE order_date is NOT NULL
GROUP BY DATETRUNC(month, order_date)
) t
