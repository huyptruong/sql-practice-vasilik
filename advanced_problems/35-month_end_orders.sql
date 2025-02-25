/*
Problem: Find all orders made on the last day of the month.
That is, if the last order was placed on, say 30-Dec-2015, then don't show it in the report.
*/

-- Method 1: Use the eomonth function.
select o.EmployeeID as employee_id
     , o.OrderID as order_id
     , o.OrderDate as order_date
  from Orders as o
 where o.OrderDate = eomonth(o.OrderDate)
 order by o.EmployeeID, o.OrderID

-- Method 2: Use the following T-SQL trick.
-- In the below dateadd function, -1 is a cheat code used to retrieve a very specific date, 1899-12-31, the last day of the year 1899.
-- The datediff function is used to find the number of months between OrderDate and 1900-01-01 (0 is the cheat code for this date).
-- By adding the number of months from the last day of the year 1899 to the OrderDate (incremented by 1), we can find the last day
-- of the month corresponding to the OrderDate.
select o.EmployeeID as employee_id
     , o.OrderID as order_id
     , o.OrderDate as order_date
  from Orders as o
 where o.OrderDate = dateadd(month, 1 + datediff(month, 0, o.OrderDate), -1)
 order by o.EmployeeID, o.OrderID

/*
However, there are actually 2 more orders where the OrderDate is the end of the month.
They are OrderID 10806 (2015-12-31 11:00:00.000) and 10807 (2015-12-31 11:00:00.000),
but were excluded in the result because of the time portion.
We can retrieve them by truncating the time portion.
*/
select o.EmployeeID as employee_id
     , o.OrderID as order_id
     , o.OrderDate as order_date
  from Orders as o
 where convert(date, o.OrderDate) = dateadd(month, 1 + datediff(month, 0, o.OrderDate), -1)
 order by o.EmployeeID, o.OrderID

/*
If the problem did ask for the last order of the month (not the order on the last day of the month),
then we use the following query.
*/
select o.EmployeeID as employee_id
     , o.OrderID as order_id
     , o.OrderDate as order_date
  from Orders as o
 where o.OrderDate in (
                        select max(o.OrderDate) as end_of_month
                          from Orders as o
                         group by year(o.OrderDate)
                                , month(o.OrderDate)
                      )
 order by o.EmployeeID, o.OrderID