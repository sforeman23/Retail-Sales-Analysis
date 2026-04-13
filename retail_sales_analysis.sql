
-- 1. Overall Business Performance
-- Total Revenue
Select Concat('$',Format(Sum(Sales),2)) as Total_Revenue from retail_sales.train;

-- 2. Sales Breakdown
-- Revenue by Category
Select category, Concat('$',Format(SUM(Sales),2)) as revenue,
RANK() OVER(Order by SUM(Sales) Desc) as revenue_rank
from retail_sales.train
Group by category;

-- Revenue by Region
Select Region, Concat('$',Format(SUM(Sales),2)) as revenue,
RANK() OVER(Order by SUM(Sales) Desc) as revenue_rank
from retail_sales.train
Group by Region;

-- 3. Time Trends
-- Monthly Sales
Select monthname(str_to_date(`Order Date`,'%d/%m/%Y')) as `Date Purchased`,Concat('$',Format(SUM(Sales),2)) as Revenue, 
RANK() Over(Order by Sum(Sales) desc) as rank_month
from retail_sales.train
Group by `Date Purchased`;


-- 4. Operational Insights
-- Late Shipments
Select Count(*) as late_shipments from retail_sales.train
where `Ship Date` > `Order Date` + 5;
-- Order Volume Patterns
Select monthname(str_to_date(`Order Date`,'%d/%m/%Y')) as `Date Purchased`, Count(*) as Orders,
Rank() Over (Order by Count(*) Desc) as order_rank
from retail_sales.train 
Group by `Date Purchased`
Order by Orders desc;

