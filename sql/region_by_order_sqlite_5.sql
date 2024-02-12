SELECT region as Region,
count(distinct CASE WHEN category='Furniture' THEN order_id ELSE NULL END) as Furniture,
count(distinct CASE WHEN category='Office Supplies' THEN order_id ELSE NULL END) as "Office Supplies",
count(distinct CASE WHEN category='Technology' THEN order_id ELSE NULL END) as Technology
FROM records
GROUP BY region
