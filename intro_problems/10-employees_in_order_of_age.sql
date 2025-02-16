/*
To order data by birthdate from oldest employees to youngest employees, use ascending order.
That's because older employees have shorter "age range" than younger employees.
An age range is calculated by subtracting the birthdate from a hypothetical anchor in the past.

For example, let's say we choose an anchor in 1900. If Alice was born in 1950, then her "age range"
is 50. If Bob was born in 1960, then his "age range" is 60. Alice's "age range" is less than Bob's "age range"
so Alice will come first if sorted by birthdate.
*/
select e.FirstName as first_name
	 , e.LastName as last_name
	 , e.Title as title
	 , e.BirthDate as birth_date
   from Employees as e
 order by e.BirthDate asc