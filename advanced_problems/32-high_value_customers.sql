select o.CustomerID as customer_id
     , c.CompanyName as company_name
     , o.OrderID as order_id
     , total_order_amount = sum(od.UnitPrice * od.Quantity)
  from Orders as o
  join OrderDetails as od
    on o.OrderID = od.OrderID
  join Customers as c
    on c.CustomerID = o.CustomerID
 where year(o.OrderDate) = 2016
 group by o.CustomerID, c.CompanyName, o.OrderID
having sum(od.UnitPrice * od.Quantity) >= 10000
 order by total_order_amount desc