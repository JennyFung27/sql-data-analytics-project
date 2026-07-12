# SQL Customer and Product Analytics Project

## Project Overview

This project uses SQL Server to analyze sales transaction data and generate customer-level and product-level business insights.

The analysis focuses on customer purchasing behavior, product performance, sales recency, customer lifespan, and revenue metrics.

## Dataset

The project uses three main datasets:

- `fact_sales`: Sales transaction records
- `dim_customers`: Customer demographic information
- `dim_products`: Product details, categories, and costs

## Business Questions

### Customer Analysis

- What is each customer's total sales and purchase quantity?
- When did each customer last place an order?
- How long has each customer been active?
- How can customers be segmented based on spending behavior?

### Product Analysis

- Which products generate the highest sales?
- How many customers purchased each product?
- What is the average selling price of each product?
- How recently was each product sold?
- Which products are high, mid-range, or low performers?

## Key Metrics

- Total Sales
- Total Orders
- Total Quantity
- Total Customers
- Average Selling Price
- Average Order Revenue
- Average Monthly Revenue
- Customer/Product Lifespan
- Recency in Months

## SQL Techniques Used

- Common Table Expressions (CTEs)
- JOINs
- Aggregate Functions
- CASE Statements
- Date Functions
- Customer and Product Segmentation
- `NULLIF`
- Data Type Conversion
- Grouping and Filtering
