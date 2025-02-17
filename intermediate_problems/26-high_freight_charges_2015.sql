  select top(3)
         o.ShipCountry as ship_country
       , avg(o.Freight) as average_freight
    from Orders as o
   where year(o.OrderDate) = 2015
group by o.ShipCountry
order by average_freight desc