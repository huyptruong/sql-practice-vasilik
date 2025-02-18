select c.ContactTitle as contact_tile
     , total_contact_title = count(*)
  from Customers as c
 group by c.ContactTitle
 order by total_contact_title desc