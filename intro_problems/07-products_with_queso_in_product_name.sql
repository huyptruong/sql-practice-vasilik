select p.ProductID as product_id
	 , p.ProductName as product_name
  from Products as p
where p.ProductName like '%queso%'