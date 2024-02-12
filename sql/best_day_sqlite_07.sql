#팁이 가장 높은 요일 구하기 
SELECT day, sum(tip) as tip_daily
FROM tips
GROUP BY day
order by tip_daily desc
limit 1