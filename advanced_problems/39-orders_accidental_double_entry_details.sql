with potential_duplicates as (
    select od.OrderID
         , od.Quantity
         , order_count = count(*)
    from OrderDetails as od
    where od.Quantity >= 60
    group by od.OrderID
            , od.Quantity
    having count(*) > 1
)
select od.OrderID as order_id
     , od.ProductID as product_id
     , od.UnitPrice as unit_price
     , od.Quantity as quantity
     , od.Discount as discount
  from OrderDetails as od
 where od.OrderID in (select distinct OrderID from potential_duplicates)
 order by od.OrderID
        , od.Quantity