select e.FirstName as first_name
	 , e.LastName as last_name
	 --, e.FirstName + ' ' + e.LastName as full_name
	 , concat(e.FirstName, ' ', e.LastName) as full_name
  from Employees as e