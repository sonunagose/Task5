create table Company (
	company_id serial primary key,
	user_id int,
	product_category varchar(100),
	product_id int,
	quantity int,
	price decimal(10,2),
	company_date date
)

select * from company

insert into company(user_id,product_category,product_id,quantity,price,company_date) values
(1,'CUP',101,2,199.99,'2024-01-01'),
(2,'Monitor',202,1,9.99,'2024-01-01'),
(3,'Keyboard',303,5,29.99,'2024-01-02'),
(4,'CUP',102,1,399.99,'2024-01-02'),
(5,'Monitor',203,2,19.99,'2024-01-03'),
(1,'Keyboard',101,1,199.99,'2024-01-04'),
(2,'CUP',304,3,39.99,'2024-01-05'),
(3,'Monitor',204,4,14.99,'2024-01-05'),
(4,'Keyboard',103,1,299.99,'2024-01-06'),
(5,'CUP',305,2,49.99,'2024-01-07')

select * from company

	--- Count---
	
select count (distinct company_id) from company

select count (distinct product_category) from company

select count (distinct quantity) from company

select distinct quantity from company

-----Sum---

select sum(price) from company where quantity = 4

select sum(price) from company where quantity = 3

select sum(price) from company where product_id = 304

select sum(price) from company where product_id = 202

--total sales per product category---

select product_category, sum(price * quantity) AS total_sales from company
group by product_category order by total_sales

select product_category, sum(price * quantity) AS total_sales from company
group by product_category order by total_sales desc

--avg sales per user

select user_id, avg(price * quantity) AS average_sales from company
group by user_id order by average_sales desc

select quantity, sum(price) from company group by quantity

select product_category, sum(quantity) from company group by product_category
 order by sum(quantity) desc limit 1

select sum(quantity) from company group by product_category
 order by sum(quantity) desc limit 1

select product_category, sum(quantity) from company
  where price > 9.99 group by product_category
  having sum(quantity) > 99.00

select quantity from company order by quantity asc limit 1

select quantity from company order by quantity desc limit 1

select company_date from company order by company_date asc limit 1

select company_date from company order by company_date desc limit 1

select count(price),sum(price),min(price),max(price),avg(price) from company

---total quantity sold per product for a specific date range---

select product_id,sum(quantity) AS total_quantity from company
where company_date between '2024-01-01' AND '2024-01-05'
group by product_id order by total_quantity desc

--total sales per user or specific categories---

select user_id,sum(price * quantity) AS total_sales from company
where product_category in ('CPU','Monitor')
group by user_id order by total_sales desc

--product catergory with min quantity---

select product_category, sum(quantity) AS total_quantity from company
   group by product_category having sum(quantity) > 1

--min---
	
select user_id,sum(price * quantity) AS total_sales
from company
group by user_id having count(company_id) > 1
order by total_sales desc




 