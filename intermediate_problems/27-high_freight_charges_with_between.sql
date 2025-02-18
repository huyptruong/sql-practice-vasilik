with good_answer as (
    select o.OrderID
         , o.OrderDate
      from Orders as o
     where year(o.OrderDate) = 2015
),
bad_answer as (
    select o.OrderID
         , o.OrderDate
      from Orders as o
     where o.OrderDate between '20150101' and '20151231'
)
select ga.OrderDate as good_order_date
     , ga.OrderID as good_order_id
     , ba.OrderID as bad_order_id
     , ba.OrderDate as bad_order_date
  from good_answer as ga
  full join bad_answer as ba
    on ga.OrderID = ba.OrderID
 where ga.OrderID is null
    or ba.OrderID is null