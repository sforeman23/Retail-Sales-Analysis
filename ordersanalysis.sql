-- Queries to upload local data into workbench
SET GLOBAL local_infile = 1;


LOAD DATA LOCAL INFILE 'C:/Users/spenc/Downloads/train.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE orders (
    row_id INT PRIMARY KEY,
    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    
    product_id VARCHAR(20),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    
    sales DECIMAL(10,2)
);


-- 1. Overall Business Performance
-- Total Revenue
Select Concat('$',Format(Sum(Sales),2)) as Total_Revenue from orders;

-- 2. Sales Breakdown
-- Revenue by Category
Select category, Concat('$',Format(SUM(Sales),2)) as revenue,
RANK() OVER(Order by SUM(Sales) Desc) as revenue_rank
from orders
Group by category;

-- Revenue by Region
Select Region, Concat('$',Format(SUM(Sales),2)) as revenue,
RANK() OVER(Order by SUM(Sales) Desc) as revenue_rank
from orders
Group by Region;

-- Revenue by Mode
Select ship_mode, Concat('$',Format(SUM(sales),2)) as revenue,
RANK() OVER(Order by SUM(Sales) Desc) as revenue_rank
from orders
Group by ship_mode;

-- Revenue by Subcategory

Select sub_category, Concat('$',Format(SUM(sales),2)) as revenue,
RANK() OVER(Order by SUM(Sales) Desc) as revenue_rank
from orders
Group by sub_category;








