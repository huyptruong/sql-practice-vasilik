  select p.ProductID as product_id
       , p.ProductName as product_name
       , p.UnitsInStock as unit_in_stock
       , p.ReorderLevel as reorder_level
    from Products as p
   where p.UnitsInStock <= p.ReorderLevel
order by p.ProductID