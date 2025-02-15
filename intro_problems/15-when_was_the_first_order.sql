select top(1) o.OrderDate as first_order
  from Orders as o
order by o.OrderDate