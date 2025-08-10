show databases;

-- Create Database RetailStore --

create database Retail_Store;
show databases;

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

-- Display the imported records --

select * from Sales;

# 2. Data Exploration & Cleaning

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
-- Rename the column Quantity --
alter table Sales
change Quantiy Quantity INT;

-- Count no.of Transactions --
select COUNT(*) Transactions_ID FROM Sales;

-- Count no.of unique Customers --
select count(distinct(Customer_ID)) from Sales;

-- Unique Categories in the Table --
select distinct Category from Sales;

-- Show the min, max and Average of price_per_unit --
SELECT 
  MIN(Price_per_unit) AS Min_Price_Per_Unit,
  MAX(Price_per_unit) AS Max_Price_Per_Unit,
  AVG(Price_per_unit) AS Avg_Price_Per_Unit
FROM Sales;

# 3. Data Analysis & Findings

-- Write a SQL query to retrieve all columns for sales made on '2022-11-05: --
select * from Sales
where
Sale_Date = '2022-11-05';

-- Write a SQL query to retrieve all transactions where the category is 
	-- 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022: --

select * from Sales
where 
	Category = 'Clothing'
    AND
    Quantity >= 4
    AND
    Sale_Date between '2022-11-01' AND '2022-11-30';
    
-- Write a SQL query to calculate the total sales (total_sale) for each category.: --
select Category, SUM(Total_sale) as Sales_Per_Category from Sales
Group by Category;

-- Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.: --
select Category , ROUND(AVG(Age),0) as average_age_of_customers from Sales
where Category = 'Beauty'
Group by Category;

-- Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:--
select Category, Gender, count(Transactions_ID) as Total_Number_of_Transactions from Sales
group by Category, Gender;

-- Write a SQL query to calculate the average sale for each month. --
select 
month(Sale_Date) as Sale_Month, 
concat('$',round(avg(Total_sale),1)) as Avg_Sale from Sales
group by Sale_Month
order by Sale_Month;

-- Find out best selling month in each year: --
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

-- Write a SQL query to find the top 5 customers based on the highest total sales --
select Customer_ID, sum(Total_sale) from Sales
Group By Customer_ID
ORDER BY SUM(Total_sale) desc limit 9;

-- Write a SQL query to find the number of unique customers who purchased items from each category.: --
select Category, count(distinct Customer_ID) AS Count_of_Unique_Customers from Sales
group by Category;






