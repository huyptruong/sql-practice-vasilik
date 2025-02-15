/*
select top(100) *
  from Orders as o;

select top(100) *
   from Shippers as s;
*/

select o.OrderID as order_id
	 , o.OrderDate as order_date
	 , s.CompanyName as shipper
  from Orders as o
 join Shippers as s
  on o.ShipVia = s.ShipperID
 where o.OrderID < 10270
 order by o.OrderID
