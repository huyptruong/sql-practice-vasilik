select p.ProductID as product_id
     , p.ProductName as product_name
     , p.UnitsInStock as unit_in_stock
     , p.UnitsOnOrder as unit_on_order
     , p.ReorderLevel as reorder_level
     , p.Discontinued as discontinued
  from Products as p
 where (p.UnitsInStock + p.UnitsOnOrder <= p.ReorderLevel)
  and p.Discontinued = 0
order by p.ProductID