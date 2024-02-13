#최초 주문일자와 마지막 일자 조회
SELECT STRFTIME('%Y-%m-%d', MIN(order_purchase_timestamp)) AS first_order_date, 
STRFTIME('%Y-%m-%d', MAX(order_purchase_timestamp))AS last_order_date
FROM olist_orders_dataset