/*
select top(10) *
  from Suppliers as s

select top(10) *
  from Products as p
*/


select p.ProductID as product_id
	 , p.ProductName as product_name
	 , s.CompanyName as company_name
  from Suppliers as s
join Products as p
  on s.SupplierID = p.SupplierID