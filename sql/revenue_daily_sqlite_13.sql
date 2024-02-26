SELECT day, sum(total_bill) as revenue_daily
FROM tips
GROUP BY day
HAVING revenue_daily >= 1000
order by revenue_daily DESC