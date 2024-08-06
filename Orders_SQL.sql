create database pythonSql;

use pythonSql;

CREATE TABLE df_orders (
    order_id INT PRIMARY KEY,
    order_date date,
    ship_mode VARCHAR(20),
    segment VARCHAR(20),
    country VARCHAR(20),
    city VARCHAR(20),
    state VARCHAR(20),
    postal_code VARCHAR(20),
    region VARCHAR(20),
    category VARCHAR(20),
    sub_category VARCHAR(20),
    product_id VARCHAR(50),
    quantity INT,
    discount DECIMAL(7,2),
    sale_price DECIMAL(7,2),
    profit DECIMAL(7,2)
);

-- Find top 10 highest revenue generating products

select product_id,sum(sale_price) as sales 
from df_orders
group by 1
order by sales desc
limit 10
;

-- Top 5 highest selling products in each region

with cte as (
select region,product_id,sum(sale_price) as sales
from df_orders
group by 1,2)
select * from
(select *
,row_number() over(partition by region order by sales desc) as rn
from cte) A
where rn <=5;

-- find month over month growth comparison for 2022 and 2023 sales eg : jan 2022 vs jan 2023 

with cte as (
select year(order_date) order_year,month(order_date) order_month,sum(sale_price) as sales 
from df_orders
group by 1,2
)
select order_month
, sum(case when order_year=2022 then sales else 0 end) as sales_2022
, sum(case when order_year=2023 then sales else 0 end) as sales_2023
from cte 
group by order_month
order by order_month;

-- for each category which month had highest sales
with cte as (
    select 
        category,
        date_format(order_date, '%Y%m') as order_year_month,
        sum(sale_price) as sales
    from df_orders
    group by category, order_year_month
    order by category, order_year_month
    limit 0, 1000
)
select * from (
    select *,
        row_number() over(partition by category order by sales desc) as rn
    from cte
) a
where rn = 1;

-- which sub category had highest growth by profit in 2023 compare to 2022

with cte as (
    select sub_category, year(order_date) as order_year, sum(profit) as total_profit
    from df_orders
    group by sub_category, year(order_date)
)
select sub_category,
       sum(case when order_year = 2022 then total_profit else 0 end) as profit_2022,
       sum(case when order_year = 2023 then total_profit else 0 end) as profit_2023,
       (sum(case when order_year = 2023 then total_profit else 0 end) - 
        sum(case when order_year = 2022 then total_profit else 0 end)) as profit_growth
from cte
group by sub_category
order by profit_growth desc
limit 1;
