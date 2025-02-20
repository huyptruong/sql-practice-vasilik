/*
Practicality matters: Though the where statement may look odd, it's easier to read, understand and modify.
Also, many times the list of items you're filtering for will be coming from somewhere else, like Excel, and will already be on separate lines.
*/
select o.OrderID as order_id
     , o.CustomerID as customer_id
     , o.ShipCountry as ship_country
  from Orders as o
 where o.ShipCountry in 
                        (
                           'France'
                         , 'Belgium'
                        )