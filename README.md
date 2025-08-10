# Retail-Store-Data-Analytics-SQL

Retail Store Sales Data Analysis using SQL. Created database and table, explored data for nulls, renamed columns, counted transactions and customers. Analyzed sales by date, category, customer age, gender, monthly trends, top customers, and unique customers per category.

## Overview 

**Project:** Retail Store Analysis
**Database:** `Retail_Store`
**Table:** `Sales`

## Objective 

- Create and manage a relational database to store retail store sales data.

- Perform data exploration and cleaning to ensure data quality (e.g., checking for null values, correcting column names).

- Analyze sales transactions by date, category, quantity, and customer demographics (age, gender).

- Calculate aggregated metrics such as total sales per category and average price per unit.

- Identify sales trends over time, including monthly average sales and best-selling months each year.

- Determine top customers based on total sales value.

- Evaluate customer distribution and transaction counts by category and gender.

- Use advanced SQL features like window functions (RANK) for ranking sales data.

## Project Structure

### 1. Database Setup
**- Creation of Database:** This is the initial Step in the Project. Created a database named `Retail_Store`.

**- Creation of the Table:** A table named `Sales` is created to store retail store sales data. The table structure includes columns for `Transaction_ID`, `Sale_Date`, `Sale_ Time`, `Customer_ID`, `Gender`, `Age`, `Product Category`, `Quantity`, `Price_per_unit`, `Cost_of_goods_sold (COGS)`, and `Total_sale_amount`.

```sql
-- Create Database RetailStore --

create database Retail_Store;

-- Create Table Sales --
use Retail_Store;

create table Sales(Transactions_ID int primary key,
Sale_Date date,
Sale_Time time,
Customer_ID int,
Gender varchar (10),
Age int,
Category varchar (20),
Quantiy int,
Price_per_unit float,
Cogs float,
Total_sale float);
```

### 2. Exploratory Analysis (EDA) & Cleaning
**Null_Value_Check:** Queried the table to identify any NULL values in all important columns.

```sql
-- Check for the Null values --

select * from Sales WHERE
Transactions_ID IS NULL
OR
Sale_Date IS NULL
OR
Sale_Time IS NULL
OR
Customer_ID IS NULL
OR
Gender IS NULL
OR
Age IS NULL
OR
Category IS NULL
OR
Quantiy IS NULL
OR
Price_per_unit IS NULL
OR
Cogs IS NULL
OR
Total_sale IS NULL
;
```
**Transaction Count:** Counted the total number of transactions in the dataset.

```sql
-- Count no.of Transactions --
select COUNT(*) Transactions_ID FROM Sales;
```
