  select c.CustomerID as customer_id
       , c.CompanyName as company_name
       , c.Region as region
    from Customers as c
order by
    case 
        when region is null then 1
        else 0
    end
       , region
       , customer_id