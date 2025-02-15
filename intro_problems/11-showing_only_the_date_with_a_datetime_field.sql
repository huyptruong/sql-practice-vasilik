select e.FirstName as first_name
	 , e.LastName as last_name
	 , e.Title as title
	 , convert(date, e.BirthDate) as birth_date
   from Employees as e
order by e.BirthDate asc;