/*Analyze Sales Performance over time*/

SELECT
    YEAR(order_date) order_year,
    SUM(sales_amount) total_sales,
    COUNT(DISTINCT customer_key) total_customers,
    SUM(quantity) total_quantity
FROM gold.fact_sales
WHERE order_date is NOT NULL
GROUP BY YEAR(order_date)
ORDER BY YEAR(order_date)

/*Change over Months*/
SELECT
    YEAR(order_date) order_year,
    MONTH(order_date) order_month,
    SUM(sales_amount) total_sales,
    COUNT(DISTINCT customer_key) total_customers,
    SUM(quantity) total_quantity
FROM gold.fact_sales
WHERE order_date is NOT NULL
GROUP BY YEAR(order_date),MONTH(order_date)
ORDER BY YEAR(order_date),MONTH(order_date) 

SELECT
    DATETRUNC(Month, order_date) order_date,
    SUM(sales_amount) total_sales,
    COUNT(DIStinct customer_key) total_customers,
    SUM(quantity) total_quantity
FROM gold.fact_sales
WHERE order_date is NOT NULL
GROUP BY DATETRUNC(Month, order_date)
ORDER BY DATETRUNC(Month, order_date)