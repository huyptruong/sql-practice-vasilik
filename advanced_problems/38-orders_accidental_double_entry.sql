/*
How many orders with duplicate Quantity and having at least 60 items are there?
*/
select od.OrderID
     , od.Quantity
     , order_count = count(*)
  from OrderDetails as od
 where od.Quantity >= 60
 group by od.OrderID
        , od.Quantity
having count(*) > 1
 order by od.OrderID