select i.CustomerID as customer_id
     , i.OrderID as initial_order_id
     , i.OrderDate as initial_order_date
     , n.OrderID as next_order_id
     , n.OrderDate as next_order_date
     , day_between_order = datediff(dd, i.OrderDate, n.OrderDate)
  from Orders as i -- initial order
  join Orders as n -- next order
    on i.CustomerID = n.CustomerID -- create all possible pairs of OrderID for each customer
 where i.OrderID < n.OrderID
   and datediff(dd, i.OrderDate, n.OrderDate) <= 5
 order by i.CustomerID
        , i.OrderID