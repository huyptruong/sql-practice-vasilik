select o.OrderID as order_id
	 , o.CustomerID as customer_id
	 , o.ShipCountry as ship_country
  from Orders as o
where o.ShipCountry in ('France', 'Belgium')