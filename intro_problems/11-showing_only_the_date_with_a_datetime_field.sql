/*
I really like this style: When the calculation is long and convoluted, it's best to choose a good name for it.
And by choosing a good name when writing, when reading it again I don't need to scan through the calculation,
saving me some time and effort.
*/
select e.FirstName as first_name
     , e.LastName as last_name
     , e.Title as title
     , birth_date = convert(date, e.BirthDate)
  from Employees as e
 order by e.BirthDate asc;