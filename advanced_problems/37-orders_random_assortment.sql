select top 2 percent
       o.OrderID as order_id
  from Orders as o
 order by newid() -- newid() generates a globally unique identifier (GUID) for each row. may cause performance problems on a very large table
