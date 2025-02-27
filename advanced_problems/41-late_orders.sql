select o.OrderID
     , o.OrderDate
     , o.RequiredDate
     , o.ShippedDate
  from Orders as o 
 where o.RequiredDate <= o.ShippedDate
 order by o.OrderID