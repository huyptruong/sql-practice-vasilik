with 
supplier_country as (
  select Country 
       , total = count(*)
    from Suppliers
   group by Country
),
customer_country as (
  select Country
       , total = count(*)
    from Customers
   group by Country
),
all_country as (
  select Country from supplier_country
  union
  select Country from customer_country
)
select a.Country as country
     , coalesce(s.total, 0) as total_supplier
     , coalesce(c.total, 0) as total_customer
  from all_country as a 
  left join supplier_country as s 
    on a.Country = s.Country
  left join customer_country as c
    on a.Country = c.Country