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
     , total_late_order = coalesce(l.total_late_order, 0)
     , percent_late_order = coalesce(l.total_late_order, 0) / cast(a.total_order as float)
  from all_order as a 
  join Employees as e
    on a.EmployeeID = e.EmployeeID
  left join late_order as l
    on a.EmployeeID = l.EmployeeID
 order by a.EmployeeID