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

**Unique Customers:** Counted the distinct number of customers based on `Customer_ID`.

``` sql
-- Count no.of unique Customers --
select count(distinct(Customer_ID)) from Sales;
```

**Category Exploration:** Retrieved all unique product categories available in the data.

```sql
-- Unique Categories in the Table --
select distinct Category from Sales;
```

**Price per Unit Statistics:** Calculated the minimum, maximum, and average price per unit across all sales.

```sql
-- Show the min, max and Average of price_per_unit --
SELECT 
  MIN(Price_per_unit) AS Min_Price_Per_Unit,
  MAX(Price_per_unit) AS Max_Price_Per_Unit,
  AVG(Price_per_unit) AS Avg_Price_Per_Unit
FROM Sales;
```

### 3. Analysis & Findings

a. Write a SQL query to retrieve all columns for sales made on '2022-11-05:

```sql
select * from Sales
where
Sale_Date = '2022-11-05';
```

b. Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:
``` sql

select * from Sales
where 
	Category = 'Clothing'
    AND
    Quantity >= 4
    AND
    Sale_Date between '2022-11-01' AND '2022-11-30';
```

c. Write a SQL query to calculate the total sales (total_sale) for each category
```sql
select Category, SUM(Total_sale) as Sales_Per_Category from Sales
Group by Category;
```

d.  Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
```sql
select Category , ROUND(AVG(Age),0) as average_age_of_customers from Sales
where Category = 'Beauty'
Group by Category;
```

e. Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category
```sql
select Category, Gender, count(Transactions_ID) as Total_Number_of_Transactions from Sales
group by Category, Gender;
```

f. Write a SQL query to calculate the average sale for each month.
```sql
select 
month(Sale_Date) as Sale_Month, 
concat('$',round(avg(Total_sale),1)) as Avg_Sale from Sales
group by Sale_Month
order by Sale_Month;
```

g. Find out best selling month in each year
```sql
SELECT Sale_Year, Sale_Month, Sales_Total
FROM (
    SELECT  
        YEAR(Sale_Date) AS Sale_Year, 
        MONTH(Sale_Date) AS Sale_Month, 
        SUM(Total_sale) AS Sales_Total, 
        RANK() OVER (
            PARTITION BY YEAR(Sale_Date) 
            ORDER BY SUM(Total_sale) DESC
        ) AS rnk
    FROM Sales
    GROUP BY YEAR(Sale_Date), MONTH(Sale_Date)
) AS ranked
WHERE rnk = 1;
```

h. Write a SQL query to find the top 5 customers based on the highest total sales
```sql
select Customer_ID, sum(Total_sale) from Sales
Group By Customer_ID
ORDER BY SUM(Total_sale) desc limit 5;
```
I. Write a SQL query to find the number of unique customers who purchased items from each category
```sql
select Category, count(distinct Customer_ID) AS Count_of_Unique_Customers from Sales
group by Category;
```

### 4. Reports

- Sales on Specific Dates: Extracted sales data for particular dates (e.g., 2022-11-05) for targeted analysis.

- Category-based Filtering: Retrieved sales for specific product categories (e.g., Clothing with quantity > 4 in Nov 2022).

- Category-wise Total Sales: Summarized total sales amounts per product category.

- Customer Demographics: Calculated average customer age for the Beauty category.

- Gender-based Transactions: Counted total transactions by gender within each product category.

- Monthly Trends: Calculated average sales per month and identified best-selling months for each year.

- Top Customers: Listed top 5 customers based on highest total purchase amounts.

- Unique Customers per Category: Counted distinct customers for each product category.


