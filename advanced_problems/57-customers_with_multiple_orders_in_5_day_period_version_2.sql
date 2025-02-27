with
next_order_date as (
    select o.CustomerID
         , o.OrderDate 
         , next_order_date = lead(o.OrderDate, 1) over (partition by o.CustomerID order by o.CustomerID, o.OrderDate)
      from Orders as o 
)
select n.CustomerID as customer_id
     , n.OrderDate as order_date
     , n.next_order_date as next_order_date
     , day_between_order = datediff(dd, n.OrderDate, n.next_order_date)
  from next_order_date as n
 where datediff(dd, n.OrderDate, n.next_order_date) <= 5