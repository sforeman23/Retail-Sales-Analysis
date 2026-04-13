Select Category, Concat('$',Format(SUM(Sales),2)) as Revenue from retail_sales.train
Group by Category
Order by Category;	

Select month(str_to_date(`Order Date`,'%d/%m/%Y')) as `Date Purchased`,Concat('$',Format(SUM(Sales),2)) as Revenue from retail_sales.train
Group by `Date Purchased`
Order by `Date Purchased`;

Select Region,Concat('$',Format(Sum(Sales),2)) as Revenue from retail_sales.train
Group by Region;

Select Count(*) as late_shipments from retail_sales.train
where `Order Date` > `Ship Date`;

