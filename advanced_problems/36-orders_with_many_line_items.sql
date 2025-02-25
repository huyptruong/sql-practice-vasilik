select top (10)
       o.OrderID as order_id
     , total_order_details = count(od.OrderID)
  from Orders as o
  join OrderDetails as od
    on o.OrderID = od.OrderID
 group by o.OrderID
 order by count(od.OrderID) desc