-- Notice that we filter to EmployeeID 4 at the join clause, not at the where clause
select c.CustomerID as customers_customer_id
     , o.CustomerID as orders_customer_id
     , o.EmployeeID
  from Customers as c
  left join Orders as o
    on c.CustomerID = o.CustomerID
   and o.EmployeeID = 4
  where o.CustomerID is null