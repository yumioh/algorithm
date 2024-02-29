SELECT
  bike_id
FROM
  rental_history
WHERE
  date(rent_at) between "2021-01-01" AND "2021-01-31"
GROUP BY
  bike_id
HAVING
  sum(distance) >= 50000