#식사 금액이 테이블 당 평균 식사 금액보다 더 많은 경우를 모두 출력
SELECT
   *
FROM
  tips
WHERE total_bill > ((SELECT sum(total_bill) FROM tips) / (SELECT count(*) FROM tips))