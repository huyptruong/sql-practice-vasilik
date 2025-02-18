select e.FirstName as first_name
     , e.LastName as last_name
     , full_name = concat(e.FirstName, ' ', e.LastName)
     --, full_name = e.FirstName + ' ' + e.LastName
  from Employees as e