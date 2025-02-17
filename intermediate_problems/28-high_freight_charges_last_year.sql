/*
Working with datetime is very tricky because of edge cases.
In this problem, the edge cases happen at the 12-th month.
For example, if the last order date is 2016-05-06, then the
answer should exclude orders prior to this date (e.g., 2016-05-05).
*/
-- INCORRECT: It includes the orders with dates that past the 12 month mark
-- but its month is still within the 12 month mark.
  select top (3) 
         o.ShipCountry as ship_country
       , avg(o.Freight) as average_freight
    from Orders as o
   where datediff(month, o.OrderDate, (select max(OrderDate) from Orders)) <= 12 -- this only concerns with the month part, but not the date part
group by o.ShipCountry
order by average_freight desc;

-- CORRECT: It excludes the orders with dates that past the 12 month mark.
  select top (3) 
         o.ShipCountry as ship_country
       , avg(o.Freight) as average_freight
    from Orders as o
   where o.OrderDate >= dateadd(yy, -1, (select max(OrderDate) from Orders)) -- returns the date one year ago
group by o.ShipCountry
order by average_freight desc;

-- This shows the orders in my approach that should be excluded.
with myapproach as(
    select *
      from Orders as o
     where datediff(month, o.OrderDate, (select max(OrderDate) from Orders)) <= 12
),
theirapproach as(
    select *
      from Orders as o
     where orderdate >= dateadd(yy, -1, (select max(OrderDate) from Orders))
)
select m.OrderID as my_order_id
     , m.OrderDate as my_order_date
     , t.OrderID as their_order_id
     , t.OrderDate as their_order_date
  from myapproach as m
  full outer join theirapproach as t
               on m.OrderID = t.OrderID
 where m.OrderID is null or t.OrderID is null