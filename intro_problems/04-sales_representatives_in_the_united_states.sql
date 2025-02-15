select e.FirstName as first_name
	 , e.LastName as last_name
	 , e.HireDate as hire_date
  from Employees as e
where e.Title = 'Sales Representative'
  and e.Country = 'USA'