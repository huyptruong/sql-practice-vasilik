  select c.CategoryName as category_name
       , COUNT(*) as total_product
    from Categories as c
    join Products as p
      on c.CategoryID = p.CategoryID
group by c.CategoryName
order by total_product desc