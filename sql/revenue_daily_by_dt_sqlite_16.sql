SELECT
  strftime ('%Y-%m-%d', order_purchase_timestamp) as dt,
  round(sum(payment_value), 2) revenue_daily
FROM
  olist_orders_dataset o,
  olist_order_payments_dataset p
WHERE
  o.order_id = p.order_id
  AND dt >= '2018-01-01'
GROUP BY
  dt
order by
  dt