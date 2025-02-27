select o.EmployeeID
     , e.LastName
     , total_late_orders = count(*)
  from Orders as o 
  join Employees as e 
    on e.EmployeeID = o.EmployeeID
 where o.RequiredDate <= o.ShippedDate
 group by o.EmployeeID
        , e.LastName
 order by total_late_orders desc 