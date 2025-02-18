select od.OrderID as order_id
     , od.ProductID as product_id
     , od.UnitPrice as unit_price
     , od.Quantity as quantity
     , total_price = od.UnitPrice * od.Quantity
  from OrderDetails as od