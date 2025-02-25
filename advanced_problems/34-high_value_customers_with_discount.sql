select o.CustomerID as customer_id
     , c.CompanyName as company_name
     , total_order_amount = sum((od.UnitPrice * od.Quantity) * (1 - od.Discount))
  from Orders as o
  join OrderDetails as od
    on o.OrderID = od.OrderID
  join Customers as c
    on c.CustomerID = o.CustomerID
 where year(o.OrderDate) = 2016
 group by o.CustomerID, c.CompanyName
having sum((od.UnitPrice * od.Quantity) * (1 - od.Discount)) >= 10000
 order by total_order_amount desc