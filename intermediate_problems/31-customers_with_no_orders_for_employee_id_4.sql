/*
Notice that the query is asking for customers who have not placed any orders with a specific employee, EmployeeID = 4.
It's incorrect to place the condition at the where clause.

It'd be interesting to know how to do this for an arbitrary number of employees!
*/
select c.CustomerID as customers_customer_id
     , o.CustomerID as orders_customer_id
     , o.EmployeeID
  from Customers as c
  left join Orders as o
    on c.CustomerID = o.CustomerID 
   and o.EmployeeID = 4 -- add the filter, not at the where clause. adding filter at the where clause gives incorrect result
  where o.CustomerID is null