--보호소에서는 몇 시에 입양이 가장 활발하게 일어나는지 알아보려 합니다. 
-- 0시부터 23시까지, 각 시간대별로 입양이 몇 건이나 발생했는지 조회하는 SQL문을 작성해주세요. 이때 결과는 시간대 순으로 정렬해야 합니다.
--FM을 붙이면 월일 앞 0을 제거해줌
SELECT D.HOUR , COUNT(O.DATETIME) AS COUNT
FROM ANIMAL_OUTS O
RIGHT JOIN ( SELECT LEVEL-1 AS HOUR FROM DUAL CONNECT BY LEVEL <= 24
) D ON TO_CHAR(O.DATETIME, 'FMHH24') = TO_CHAR(D.HOUR)
GROUP BY D.HOUR
ORDER BY HOUR