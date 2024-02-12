#올림픽 개최 도시 조회
SELECT year, upper(substr(city,1,3)) as city
FROM games
WHERE year >= 2000
ORDER BY year DESC
