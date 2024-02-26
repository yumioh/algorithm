SELECT day, time, round(avg(tip), 2) as avg_tip , round(avg(size),2) as avg_size
FROM tips
GROUP BY day, time
order by day, time