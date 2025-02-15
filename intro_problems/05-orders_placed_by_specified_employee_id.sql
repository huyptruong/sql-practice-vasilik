select o.OrderID as order_id
	 , o.OrderDate as order_date
  from Orders as o
where o.EmployeeID = 5