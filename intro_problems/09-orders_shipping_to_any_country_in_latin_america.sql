select o.OrderID as order_id
     , o.CustomerID as customer_id
     , o.ShipCountry as ship_country
  from Orders As o
 where o.ShipCountry in 
                        (
                           'Brazil'
                         , 'Mexico'
                         , 'Argentina'
                         , 'Venezuela'
                        )