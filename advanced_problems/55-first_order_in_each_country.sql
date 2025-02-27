with 
first_order as (
    select o.ShipCountry
         , order_date = min(o.OrderDate)
      from Orders as o 
     group by o.ShipCountry
)
select o.ShipCountry as ship_country
     , o.CustomerID as customer_id
     , o.OrderID as order_id
     , order_date = convert(date, f.order_date)
  from Orders as o 
  join first_order as f 
    on o.ShipCountry = f.ShipCountry
   and o.OrderDate = f.order_date