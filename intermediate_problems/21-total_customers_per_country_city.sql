select c.Country as country
     , c.City as city
     , total_customer = COUNT(*)
  from Customers as c
 group by c.Country, c.City
 order by total_customer desc