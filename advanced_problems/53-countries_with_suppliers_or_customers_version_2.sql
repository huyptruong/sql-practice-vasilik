select distinct 
       s.Country as supplier_country
     , c.Country as customer_country
  from Suppliers as s 
  full join Customers as c 
    on s.Country = c.Country