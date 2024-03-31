# Axon-Sales-Insights


## Overview
Axon, a small retail company specializing in classic cars, is encountering challenges with managing and analyzing their sales data. The lack of a centralized system for data analysis has led to difficulties in decision-making due to inaccurate and outdated sales reports. This capstone project aims to address these challenges by implementing a BI solution using PowerBI and SQL, enabling effective data management and analysis.

## Objective
The primary goal is to design and implement a business intelligence (BI) solution that allows for efficient management and analysis of sales data. This solution will:
1. Integrate sales data from a MySQL database into PowerBI for centralized data management.
2. Clean and transform the data within PowerBI to ensure it is analysis-ready.
3. Develop interactive dashboards and reports in PowerBI to aid the sales team and management in understanding the data.
4. Utilize SQL for advanced analytics to derive insights that could improve sales.
5. Provide real-time access to dashboards and reports for informed decision-making by the management.

## MySQL Database Schema
The database consists of eight tables critical for sales data analysis:
- **Customers**: Contains data on customers.
- **Products**: Lists the scale model cars available for sale.
- **ProductLines**: Categorizes the products into different product lines.
- **Orders**: Records sales orders placed by customers.
- **OrderDetails**: Details each sales order's line items.
- **Payments**: Tracks payments made by customers.
- **Employees**: Includes information on employees and the organizational structure, highlighting reporting lines.
- **Offices**: Contains data on sales offices.

## Tools Required
- **MySQL (Version 8.0+)**: For database management and advanced analytics.
- **PowerBI Desktop**: For creating interactive dashboards and reports.


## Data Source

The primary source of data for this analysis is the Classic Models Database, which includes several tables related to products, customers, orders, and more. These tables have been restructured into a more analysis-friendly format.

## Schema Creation

To optimize our data for analysis, we've created a new schema that organizes the database into fact and dimension tables. This structure is designed to simplify queries, improve performance, and enhance the clarity of our data models.

### Fact Table

- **FactOrders**: Combines data from the `Orders` and `OrderDetails` tables to capture all transactional information.
![factorders](sql-images\creating-fact-table.png)

### Dimension Tables

- **DimCustomer**: Stores detailed information about customers.
- **DimEmployees**: Contains employee data, including organizational structure.
- **DimOffices**: Lists information about sales offices.
- **DimProducts**: Catalogs products sold by the retailer.
  ![dimcustomer]([sql-images\creating-fact-table.png](https://github.com/grgiri/Axon-Sales-Insights/blob/main/sql-images/creating-dimension-table.png?raw=true))


### Subdimension Tables

- **DimPayments**: Tracks payment details associated with orders.
- **ProductLines**: Describes the product line categories.

The restructuring into fact and dimension tables allows for more sophisticated analyses and easier report generation.


# Axon Classic Cars Sales Analysis

## Project Overview

This project leverages Power BI and SQL to transform, model, and analyze Axon's classic car sales data. Our goal is to uncover actionable insights that can drive better decision-making and improve sales performance.

## Data Preparation

### Data Loading and Transformation

- connected mysql database to powerbi for further transformation
- **Transformations:** 
  - Merged name and address columns.
  - Cleaned phone number column.
  
  - Removed columns with null values in `productlines`.
  - Dropped the state column due to null values.

  

## Data Modeling

Utilized the transformed data to establish a model showcasing the relationship between facts, dimensions, and sub-dimensions, including a Date table to enhance time-based analysis.


## Visualization and Reporting

Using PowerBI, we've developed a series of interactive dashboards and reports that leverage our newly structured data. These tools provide real-time insights into sales trends, employee performance, and customer behavior, among other key business metrics.

1. **Sales Overview:** Revenue, profit over time, top customers and employees, and quarterly sales by territory.

2. **Order Overview:** Monthly average order value and order count, total orders with on-time delivery and quality issues, and a heatmap of orders.

3. **Customer Overview:** Analysis of customer behavior and engagement.

4. **Product Overview:** Inventory levels, top-selling products, and vendor quality issues.


### Key Performance Indicators (KPIs)

- Year-over-year revenue and profit comparison.

- Insights on order volume, on-time delivery, quality issues, and average order value.


## Data Analysis Expressions (DAX)

Included DAX formulas for average order amount, order segment, previous year's profit, and on-time delivery metrics.

## Advanced Analytics in SQL

Performed SQL queries to analyze inventory levels, customer payments, average order values by product line, and sales by country.

## Key Insights

1. **Strong Growth in the EMEA Region:** The EMEA region exhibited the highest total sales, recording $1.47M in 2003 and showing a substantial increase to $2.05M in 2004. This suggests a burgeoning market with increasing demand that Axon could further capitalize on with targeted marketing and sales strategies.

2. **Popularity of Classic Cars:** Over 40% of total sales across all years were attributed to classic cars, highlighting them as the most favored product line. This insight suggests a stable market demand for classic cars, indicating that Axon could benefit from expanding its classic car inventory and exploring related marketing campaigns.

3. **Top Customers and Employees:** Analysis identified key customers such as Euro Shopping Channel and Mini Gifts Distributors as top purchasers, and Gerard Fernandez and Leslie Jennings as top-performing sales employees with sales of $1.22M and $1.02M, respectively. Recognizing and incentivizing top customers and employees could enhance sales and morale.

4. **Inventory and Quality Insights:** The analysis revealed specific products like the 1992 Ferrari 360 Spider red as top sellers, accounting for 3.26% of total sales, while identifying inventory shortages for certain models. Moreover, a higher volume of customer complaints in the EMEA region, especially related to planes and classic cars, signals a need for Axon to revisit vendor quality checks and customer service policies to ensure customer satisfaction and repeat business.

5. **Sales and Order Patterns:** A significant number of orders were placed in November, likely driven by holiday sales, suggesting that strategic promotions and stock preparations during this period could boost sales. Additionally, the insight into average order amounts and total orders across years provides Axon with a clear view of sales trends, enabling better forecasting and inventory management.

6. **Segmentation and Delivery:** The analysis also segmented orders into different value tiers, providing insights into customer spending behaviors. Observations on on-time delivery rates and quality issues with orders point towards operational areas that require improvement to enhance customer satisfaction and loyalty.

## Conclusion

This analysis provides Axon with a deep dive into sales trends, customer behavior, and operational efficiencies. The insights will assist in strategic planning and improving overall profitability.

This Power BI and SQL project was developed as a capstone project for the Data Science course offered by OdinSchool. It represents a culmination of the skills and knowledge acquired throughout the course. The project focuses on addressing real-world business challenges faced by Axon, a classic car retailer, using data-driven analysis and business intelligence solutions.

The SQL database utilized for this project, containing comprehensive sales data, was provided by OdinSchool. This setup allowed for an authentic data analysis experience, simulating real-world conditions and constraints.

