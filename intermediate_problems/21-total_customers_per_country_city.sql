  select c.Country as country
       , c.City as city
       , COUNT(*) as total_customer
    from Customers as c
group by c.Country, c.City
order by total_customer desc