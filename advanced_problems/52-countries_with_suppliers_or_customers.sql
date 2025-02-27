(select distinct s.Country from Suppliers as s)
union
(select distinct c.Country from Customers as c)
order by Country