select c.CustomerID as customers_customer_id
     , o.CustomerID as orders_customer_id
  from Customers as c
  left join Orders as o
    on c.CustomerID = o.CustomerID
 where o.CustomerID is null
 order by c.CustomerID