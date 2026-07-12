/*
===============================================================================
Product Report
===============================================================================
Purpose:
    - This report consolidates key product metrics and behaviors.

Highlight:
1.gathers essential fields 
2.segments product by revenue to identify high-performancers, mid-range, or low-performance.
3.aggregates product-level metrics:
    -total orders
    -total sales
    -total quantity sold
    -total customers
    -lifespan
4. calculate valuable kpi:
    -recency
    average order revenue
    average monthly revenue*/

WITH base_query AS (
    SELECT
        f.order_number,
        f.order_date,
        f.customer_key,
        f.sales_amount,
        f.quantity,
        p.product_key,
        p.product_name,
        p.category,
        p.subcategory,
        p.cost 
    FROM gold.fact_sales f 
    LEFT JOIN gold.dim_products p   
        ON f.product_key = p.product_key 
    WHERE order_date is not null 
),
product_aggregations AS (
    SELECT
        product_key,
        product_name,
        category,
        subcategory,
        cost,
        DATEDIFF(month, MIN(order_date), MAX(order_date)) lifespan,
        MAX(order_date) last_sale_date,
        COUNT(DISTINCT order_number) total_orders,
        COUNT(DISTINCT customer_key) total_customers,
        SUM(sales_amount) total_sales,
        SUM(quantity) total_quantity,
        ROUND(AVG(CAST(sales_amount AS FLOAT) / Nullif(quantity, 0)),1) avg_selling_price
    FROM base_query
    GROUP BY 
    product_key,
        product_name,
        category,
        subcategory,
        cost
)

SELECT
    product_key,
     product_name,
    category,
    subcategory,
    cost,
    last_sale_date,
    DATEDIFF(MONTH, last_sale_date, GETDATE()) recency_in_months,
    CASE WHEN total_sales > 5000 THEN 'High-Performer'
        WHEN total_sales >= 10000 THEN 'Mid-range'
        ELSE 'Low-performer'
    END as product_segment,
    lifespan,
    total_orders,
    total_sales,
     total_quantity,
     total_customers,
     avg_selling_price,
     CASE WHEN total_orders = 0 THEN 0
          ELSE total_sales / total_orders
    END AS avg_order_revenue,

    CASE WHEN lifespan = 0 THEN total_sales
    ELSE total_sales / lifespan
    END AS avg_monthly_revenue
FROM product_aggregations
