select s.SupplierID as supplier_id
	 , s.ContactName as contact_name
	 , s.ContactName as contact_title
  from Suppliers as s
where s.ContactName <> 'Marketing Manager'