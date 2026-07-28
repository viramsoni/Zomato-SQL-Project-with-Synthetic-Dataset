# Zomato SQL Project with Synthetic Dataset


## Schemas 
## Insertion of Tables 
```sql
Drop table if does not exists customers;
Drop table if does not exists restaurants;
Drop table if does not exists orders;
Drop table if does not exists riders;
Drop table if does not exists deliveries;

**Customers Table**
CREATE TABLE customers (
    customer_id INT primary key,
    customer_name VARCHAR(50),
    reg_date DATE
);

**Restaurants Table**
CREATE TABLE restaurants (
    restaurant_id INT primary key,
    restaurant_name VARCHAR(55),
    city VARCHAR(20),
    opening_hours VARCHAR(55)
);

**Orders Table**
CREATE TABLE orders (
    order_id INT primary key,
    customer_id INT, --from customer table
    restaurant_id INT, -- from restaurent table
    order_item VARCHAR(55),
    order_date DATE,
    order_time TIME,
    order_status VARCHAR(25),
    total_amount FLOAT
);

**Riders Table**
CREATE TABLE riders (
    rider_id INT primary key,
    rider_name VARCHAR(55),
    signup_date DATE
);

--**Deliveries Table**
CREATE TABLE deliveries (
    delivery_id INT primary key,
    order_id INT, -- from order table
    delivery_status VARCHAR(35),
    delivery_time TIME,
    rider_id INT -- from riders table
);
```
## Add Constraints
```sql
-  add fk contsraints
alter table orders
add constraint fk_customers
foreign key (customer_id)
references customers(customer_id);


- add fk contaraints
alter table orders
add constraint fk_restaurents
foreign key (restaurant_id)
references restaurants(restaurant_id);


- add fk contaraints
alter table deliveries
add constraint fk_orders
foreign key (order_id)
references orders(order_id);


- add fk contaraints
alter table deliveries
add constraint fk_riders
foreign key (rider_id)
references riders(rider_id);
```


select * from customers;
select * from restaurants;
select * from orders;
select * from riders;
select * from deliveries;

## Handling null values
```sql
select count(*) from customers;
select count(*) from customers where customer_id is null;
select count(*) from restaurants where restaurant_name is null or city is null;
select count(*) from orders where order_date is null or order_time is null;
select * from orders where order_item is null or order_date is null or order_time is null;
```



- 1 Write a query to find the top five frequently ordered dishes by customer called Arjun Meeta in the last one year.
```sql
select c.*, o.order_item as dishes, count(o.order_item) from orders o
join customers c
on c.customer_id = o.customer_id
where c.customer_name = 'Vihaan' and order_date >= current_date - interval '3 year '
group by c.customer_id, o.order_item
order by c.customer_id, 2
```

- 2 Identify the time slot during which the most orders are being placed based on 2 hours interval.
-- Interval slots of time 
```sql
select 
	case 
		when extract (hour from order_time) between 0 and  1 then '00:00 to 02:00' 
		when extract (hour from order_time) between 2 and  3 then '02:00 to 04:00' 
		when extract (hour from order_time) between 4 and  5 then '04:00 to 06:00' 
		when extract (hour from order_time) between 6 and  7 then '06:00 to 08:00' 
		when extract (hour from order_time) between 8 and  9 then '08:00 to 10:00' 
		when extract (hour from order_time) between 10 and 11 then '10:00 to 12:00' 
		when extract (hour from order_time) between 12 and 13 then '12:00 to 14:00' 
		when extract (hour from order_time) between 14 and 15 then '14:00 to 16:00' 
		when extract (hour from order_time) between 16 and 17 then '16:00 to 18:00' 
		when extract (hour from order_time) between 18 and 19 then '18:00 to 20:00' 
		when extract (hour from order_time) between 20 and 21 then '20:00 to 22:00' 
		when extract (hour from order_time) between 22 and 23 then '22:00 to 24:00' 
	end as time_slot,
	count(order_id) as order_count
from orders
group by time_slot
order by 2 desc;
```

- we can also do by this way: 
```sql
select
floor(extract(hour from order_time) /2)*2 + 2 as start_time,
floor(extract(hour from order_time) /2)*2 as end_time,
count(*) as total_orders
from orders
group by 1,2
order by 3 desc;
```

- 3 Find the average order value per customers who has placed more than or equal to  2 orders.
```sql
select c.customer_id, c.customer_name, count(*) from customers c
join orders o
on  c.customer_id = o.customer_id
group by 1,2
having count(*) >=2
```


- 4 List the customer who has have spent more than 100K in total on food orders.
```sql

select c.customer_id, c.customer_name, sum(o.total_amount) as Total_Amount from customers c
join orders o
on c.customer_id = o.customer_id
group by 1,2
having sum(o.total_amount) >= 1000
```


- 5 Write a query to find the orders that are placed but not delivered. Return each restaurant name, city and the number of not delivered orders.
```sql
select
restaurant_name,
city,
count(*) as Not_delivered_orders

from orders o 
join customers c on o.customer_id = c.customer_id
join restaurants r on o.restaurant_id = r.restaurant_id
join deliveries d on d.order_id = o.order_id
where delivery_status is null
group by 1,2
order by 3 desc;
```


- 6 Rank restaurant by total number of revenue from the last one year including their name, total revenue and the rank within their city.
-- total_amount
--city
--rank

```sql
with rank_table as
(
select 
r.restaurant_name,
r.city,
sum (o.total_amount) as total_revenue,
rank() over(partition by r.city order by sum (o.total_amount) desc)
from restaurants r
join orders o  on r.restaurant_id = o.restaurant_id
where extract (year from order_date) = 2023
group by 1, 2 
)
select * from  rank_table
where rank = 1;
```
-- 7 Identify the most popular dish in each city based on the number of orders.
```sql
select o.order_item, r.city, count(o.order_id) as dishes,
rank() over(partition by r.city order by count(o.order_id))
from orders o
join restaurants r on r.restaurant_id = o.r	estaurant_id
group by 1,2 order by 3, 4 desc
```


- 8 Find the customers who haven't placed an order in the 2024 but did in 2023.
-- IN operator
```sql
select distinct customer_id from orders 

where extract (year from order_date) = 2023

and 

customer_id  not IN 
(select distinct customer_id from orders where extract (year from order_date) = 2024)
```
- 9 Calculate and compare the cancellation ratio of each restaurant for the year 2023 and 2024.
--cancellation ratio = order cancelled/ order completed * 100 
```sql
with cancellation_table as 
(
select r.restaurant_name, count(o.order_id) as total_orders, count(case when order_status = 'Cancelled'
then 1 end) as cancelled_orders
from orders o   
left join deliveries d on o.order_id = d.order_id
left join restaurants r on r.restaurant_id = o.restaurant_id
WHERE EXTRACT(YEAR FROM order_date) IN (2023, 2024)
group by 1
)
select restaurant_name, total_orders, round((cancelled_orders::numeric/total_orders)*100,2) as cancellation_ratio
from cancellation_table
order by 3 desc
```

- 10 Determine each Rider's average delivery time.
--avg(delievery time - order time )
--select * from riders
```sql
with delivery_time_diff  as
(
select 
o.order_id, 
r.rider_id,
o.order_time,
d.delivery_time,
r.rider_name,
d.delivery_time - o.order_time as time_difference,
extract (epoch from d.delivery_time - o.order_time + 
case when d.delivery_time <= o.order_time then interval '1 day' else interval '0 days' end )/ 60 as time_minute
from deliveries d
join orders o on d.order_id = o.order_id
join riders r on r.rider_id = d.rider_id
where delivery_status = 'Delivered'
)
SELECT  rider_name, AVG(time_minute) AS avg_delivery_time
FROM delivery_time_diff
GROUP BY rider_name order by AVG(time_minute) desc;

```

- 11 Calculate the monthly growth ratio of revenue for each restaurant.
--Monthly growth ratio = lag() compare ratio wrt total_revenue
```sql
with growth_ratio as 
(
select 
r.restaurant_id,
to_char(o.order_date , 'mm-yy') as month,
count(order_id) as current_month_order,
lag(count(order_id),1) over (partition by r.restaurant_id order by to_char(o.order_date , 'mm-yy')) as prev_month
from restaurants r
join orders o on  r.restaurant_id = o.restaurant_id
where o.order_status = 'Completed'
group by 1 , 2
order by 1,2 
)
select 
restaurant_id,
month,
prev_month,
current_month_order,
round((current_month_order::numeric - prev_month::numeric)/prev_month::numeric*100, 2) as grow_ratio
from
growth_ratio
```
--select * from deliveries
--select * from orders


- 12 Segment customers into gold/silver group based on their total spending. 
-- Compare the average order value; if the customer's total spending exceed the AOV label them as gold, otherwise label them as silver.
-- AOV - average order value 
--select * from orders, select * from customers
```sql
WITH total_spending AS (
    SELECT 
        c.customer_id, 
        c.customer_name, 
        SUM(o.total_amount) AS spending, 
        AVG(SUM(o.total_amount)) OVER() AS aov 
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    WHERE o.order_status = 'Completed'
    GROUP BY 1, 2
)
SELECT  
    customer_id, 
    customer_name, 
    spending, 
    ROUND(aov::numeric, 2) AS platform_aov,
    CASE 
        WHEN spending > aov THEN 'Gold'
        ELSE 'Silver' 
    END AS customer_type
FROM total_spending
ORDER BY spending DESC;
```

- 13 Determine each Rider's monthly earning.
```sql
WITH t1 AS (
    SELECT 
        r.rider_id, 
		r.rider_name,
        to_char(o.order_date, 'YYYY-MM') as month , 
        SUM(total_amount) AS rider_revenue
    FROM orders o 
    JOIN deliveries d ON d.order_id = o.order_id
    JOIN riders r ON r.rider_id = d.rider_id
    GROUP BY 1, 2 ,3
    ORDER BY 1, 2, 3, 4
) 
SELECT 
    rider_id, 
	rider_name,
    round(AVG(rider_revenue)::numeric * 0.08, 2) AS rider_income
FROM t1
GROUP BY 1,2 
ORDER BY 1, 2,3
```

- 14 Find the number of five, four, and three star rating each Rider has.
-- Find the number of 5-star, 4-star and 3-star rating rider has.
-- riders receive this rating on dlivery time
-- If orders delivered within 15 minutes - 5 star rating 
-- If orders delivered within 15 to 20 minutes - 4 star rating 
-- If order delivered in more than 20 minutes - 3 star rating
```sql
select rider_id, stars , count(*)

from (
with delivery_period as (
select 
o.order_id,
o.order_time,
d.delivery_time,
extract(epoch from (d.delivery_time - o.order_time + case when d.delivery_time<o.order_time 
then interval '1 day' else interval '0 day' end))/60  as delivery_min, 
d.rider_id
from orders o 
join deliveries d on o.order_id = d.order_id
join riders r on r.rider_id = d.rider_id
where delivery_status = 'Delivered'
)
select
*,
case when delivery_min <15 then '5_Star'
	when delivery_min between 15 and 20 then '4_Star'
	else '3_Star' end as stars
from delivery_period
) as t1
group by 1,2
order by 1,3 desc
```

- 15 Analyze the order frequency per day of the week and identify the peak day of each restaurant.
```sql
select * from orders
select * from restaurants

with t1 as(
select r.restaurant_name,to_char(o.order_date, 'day') as Day_of_Week,  count(o.order_id),
rank() over(partition by r.restaurant_name order by count(o.order_id) ) as rank
from orders o 
join restaurants r on o.restaurant_id = r.restaurant_id
group by 1,2)
select * from t1 
where rank = 1
```
- 16 Calculate the total revenue generated by each customer over their orders.
```sql
select c.customer_name, count(o.order_id) as order_numbers, sum(o.total_amount) as revenue from customers c
join orders o on o.customer_id = c.customer_id
group by 1
order by 1 desc,2 desc
```
- 17 Identify the sales trend by comparing each month total sales to the previous month total sales.
```sql
select extract( year from order_date),  extract( month from order_date), sum(total_amount) as sales,
lag(sum(total_amount), 1) over(order by extract( year from order_date),  extract( month from order_date) ) as previous_month
from orders
group by 1,2
```
- 18 Evaluate a Rider efficiency by determining average delivery time and identify those who has the lowest and the highest average delivery time.
-- lowest and highest avg delivery time 
```sql
with t2 as(
with t1 as (
select 
r.rider_id,
r.rider_name,
extract ( epoch from (d.delivery_time - o.order_time + case when d.delivery_time < o.order_time
then interval '1 day' else interval '0 day' end))/ 60 as delivery_min
from riders r
join deliveries d on r.rider_id = d.rider_id
join orders o on o.order_id = d.order_id
where d.delivery_status = 'Delivered' 
)
select 
rider_id, rider_name, avg(delivery_min) as avg_delivery_time
from t1
group by 1,2
)
select min(avg_delivery_time), max(avg_delivery_time) from t2
```
- 19 Track the popularity of a specific ordered item over time and identify the seasonal demand spikes 
```sql
with t1 as 
(select  order_item,  extract(month from order_date) as month, 
count(order_item) 
from orders
group by 1,2)
select 
order_item,  month,
case when month between 1 and 4 then 'winter' 
	 when month between 5 and 8 then 'spring'
	 else 'summer'end as season
from t1
order by 2
```
- 20 Rank each city based on the total revenue for the last year 2023.
```sql
select * from restaurant r
left join order o on r.orde
select * from ordde
```

