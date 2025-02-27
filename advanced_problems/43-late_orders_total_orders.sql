with all_order as (
    select o.EmployeeID
         , total_order = count(*)
      from Orders as o 
     group by o.EmployeeID
),
late_order as (
    select o.EmployeeID
         , total_late_order = count(*)
      from Orders as o 
     where o.RequiredDate <= o.ShippedDate
     group by o.EmployeeID
)
select a.EmployeeID as employee_id
     , e.LastName as last_name
     , a.total_order  
     , l.total_late_order 
  from all_order as a 
  join late_order as l
    on a.EmployeeID = l.EmployeeID
  join Employees as e
    on a.EmployeeID = e.EmployeeID
 order by a.EmployeeID