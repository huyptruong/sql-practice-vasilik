with order_amount_per_customer as (
  select o.CustomerID as customer_id
         , c.CompanyName as company_name
         , total_order_amount = sum(od.Quantity * od.UnitPrice)
    from Orders as o 
    join OrderDetails as od
      on o.OrderID = od.OrderID
    join Products as p 
      on od.ProductID = p.ProductID
    join Customers as c 
      on o.CustomerID = c.CustomerID
   where year(o.OrderDate) = 2016
   group by o.CustomerID
        , c.CompanyName
),
customer_group as (
  select a.customer_id
       , a.company_name
       , a.total_order_amount
       , t.CustomerGroupName customer_group_name
   from order_amount_per_customer as a
  cross join CustomerGroupThresholds as t 
  where a.total_order_amount >= t.RangeBottom
    and a.total_order_amount <= t.RangeTop
)
select g.customer_group_name as customer_group
     , total_in_group = count(*)
     , percentage_in_group = cast(count(*) as float) / (select count(*) from customer_group)
  from customer_group as g 
  group by g.customer_group_name
  order by count(*) desc