SELECT max(total_bill) as total_bill, tip, sex, smoker, day, time, size
FROM tips
GROUP BY day