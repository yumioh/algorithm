SELECT
  STRFTIME ('%Y-%m-%d', order_delivered_carrier_date) as delivered_carrier_date,
  count(*) as orders
FROM
  olist_orders_dataset
WHERE
  order_delivered_carrier_date is not null
  AND order_delivered_customer_date is null
  AND STRFTIME ('%Y-%m', order_delivered_carrier_date) == '2017-01'
GROUP by delivered_carrier_date
order by
  delivered_carrier_date