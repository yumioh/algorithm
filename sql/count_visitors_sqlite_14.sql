SELECT
  event_date_kst as dt,
  count(DISTINCT (user_pseudo_id)) as users
FROM
  ga
where
  event_date_kst BETWEEN '2021-08-02' AND '2021-08-09'
GROUP BY
  event_date_kst