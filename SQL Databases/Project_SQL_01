create table customers(
  customer_id int ,
  firstname text,
  lastname text,
  gender text,
  age int
);

create table items(
  items_id int ,
  name text,
  Orderby text,
  price int
);
create table Orders(
  orders_id int ,
  orders_date date,
  customer_id int,
  items_id int,
  quantity int
);

insert into customers values
  (1, 'John', 'Smith', 'M', 20),
  (2, 'Mary', 'Brown', 'F', 35),
  (3, 'David', 'Lee', 'M', 45),
  (4, 'Marry', 'White', 'F', 25),
  (5, 'Jane', 'Pete', 'F', 35),
  (6, 'Peter', 'Pan', 'M', 21),
  (7, 'Adam', 'Levi', 'M', 33),
  (8, 'Jame', 'Novas', 'M', 40),
  (9, 'Jenny', 'Kile', 'F', 18),
  (10, 'June', 'Antono', 'M', 23),
  (11, 'Bass', 'Narubet', 'M',26)
;

insert into items values
  (1, 'Hawaiian','Station', 200),
  (2, 'Seafood','Online', 300),
  (3, 'Pepperoni','Station', 400),
  (4, 'Cheese','Online', 500),
  (5, 'Pepper','Station', 200),
  (6, 'Margheita','Station', 600),
  (7, 'Napoletana','Station', 600),
  (8, 'Quattro','Online', 200),
  (9, 'Calzone','Online', 550),
  (10, 'Sicilian','Station', 450)
;

INSERT INTO orders VALUES
(1, '2023-10-18', 1, 1, 2),
(2, '2023-10-18', 1, 2, 1),
(3, '2023-10-25', 1, 3, 1),
(4, '2023-11-01', 1, 1, 1),
(5, '2023-10-17', 2, 4, 1),
(6, '2023-10-19', 2, 6, 1),
(7, '2023-10-19', 10, 1, 1),
(8, '2023-10-20', 3, 5, 1),
(9, '2023-10-28', 3, 10, 1),
(10, '2023-10-25', 4, 9, 1),
(11, '2023-10-16', 5, 3, 1),
(12, '2023-10-17', 6, 1, 1),
(13, '2023-11-02', 7, 10, 1),
(14, '2023-10-19', 8, 10, 1),
(15, '2023-10-19', 9, 2, 3),
(16, '2023-10-21', 11, 1, 2),
(17, '2023-11-03', 10, 1, 2)
;

.mode box
select * from orders;
select * from customers;
select * from items;


-- Join Query
.mode box
select
   firstname || ' ' || lastname as Full_name,
   items.name as Menu_Pizza,
   items.orderby AS OrderBy,
   orders.quantity as Quantity,
   orders.orders_date,
   quantity * price as Tota_price

from orders
join items on orders.items_id = items.items_id
join customers on orders.customer_id = customers.customer_id
where strftime('%Y-%m',orders_date) = '2023-11'
group by 1,2
order by 6 desc
;
.mode box
select
   firstname || ' ' || lastname as Full_name,
   items.name as Menu_Pizza,
   items.orderby AS OrderBy,
   orders.quantity as Quantity,
   orders.orders_date,
   quantity * price as Tota_price

from orders
join items on orders.items_id = items.items_id
join customers on orders.customer_id = customers.customer_id
where strftime('%Y-%m',orders_date) = '2023-10'
group by 1,2
order by 5  
;

-- with clause
.mode box
with Oct_orders as ( 
  select * from orders
  where strftime('%Y-%m',orders_date) = '2023-10'
)
select 
  firstname || ' ' || lastname as Full_name,
  items.name as Menu_Pizza,
  items.orderby AS OrderBy,
  orders.quantity as Quantity,
  orders.orders_date,
  quantity * price as Total_price

from orders 
join items on orders.items_id = items.items_id
join customers on orders.customer_id = customers.customer_id
order by 5
;
-- Aggregate
.mode box
SELECT *
from orders
join items on orders.items_id = items.items_id

;

.mode box
SELECT
  items.name as Pizza,
  Max(price) 
from orders
join items on orders.items_id = items.items_id
;
.mode box
SELECT
  items.name as Pizza,
  Min(price) 
from orders
join items on orders.items_id = items.items_id
;
.mode box
SELECT
  items.name as Pizza,
  sum(quantity),
  items.price,
  sum(price*quantity) as Total_price

from orders
join items on orders.items_id = items.items_id
group by name
order by 2 desc
;

.mode box
SELECT 
  items.name as Pizza,
  orderby,
  firstname || ' ' || lastname as Fullname,
  age,
  gender,
  quantity,
  price
from orders
join items on orders.items_id = items.items_id
join customers on orders.customer_id = customers.customer_id
;

.mode box
select
  firstname || ' ' || lastname as Fullname,
  case
    when age >= 30 then 'Adult'
    when age >= 20 then 'Guid'
    else 'Chiden' 
  end as Age_group
from customers
;

.mode box
select
  case
    when age >= 40 then 'Adult'
    when age >= 20 then 'Guid'
  else 'Chiden'
  end as Customers_Segment,
  round(avg(price*quantity),2) as Average,
  sum(quantity) as Quantity,
  Sum(price*quantity) as Total_price
from orders
join items on orders.items_id = items.items_id
join customers on orders.customer_id = customers.customer_id
group by 1
order by 3 desc;

