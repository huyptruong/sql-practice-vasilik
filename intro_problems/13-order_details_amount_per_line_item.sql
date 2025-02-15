select od.OrderID as order_id
	 , od.ProductID as product_id
	 , od.UnitPrice as unit_price
	 , od.Quantity as quantity
	 , od.UnitPrice * od.Quantity as total_price
  from OrderDetails as od