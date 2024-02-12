#100건 이상 주문건 조회하기

SELECT seller_id, count(DISTINCT(order_id)) as orders
FROM olist_order_items_dataset
GROUP BY seller_id
HAVING count(DISTINCT(order_id)) >= 100