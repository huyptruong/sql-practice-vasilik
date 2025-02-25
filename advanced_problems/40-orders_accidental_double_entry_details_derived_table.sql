select OrderDetails.OrderID 
     , ProductID
     , UnitPrice
     , Quantity
     , Discount
  from OrderDetails
  join (
         select distinct
                OrderID
           from OrderDetails
          where Quantity >= 60
          group by OrderID
                 , Quantity
         having count(*) > 1
        ) PotentialProblemOrders
    on PotentialProblemOrders.OrderID = OrderDetails.OrderID
 order by OrderID, ProductID 