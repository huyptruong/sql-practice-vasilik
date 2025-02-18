select top(3) 
       o.ShipCountry as ship_country
     , average_freight = avg(o.Freight)
  from Orders as o
 group by o.ShipCountry
 order by average_freight desc