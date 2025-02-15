select c.ContactTitle as contact_tile
	 , count(*) as total_contact_title
   from Customers as c
 group by c.ContactTitle
 order by total_contact_title desc