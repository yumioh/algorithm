-- CAR_RENTAL_COMPANY_CAR 테이블과 
-- CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블과 
-- CAR_RENTAL_COMPANY_DISCOUNT_PLAN 테이블에서 
-- 자동차 종류가 '세단' 또는 'SUV' 인 자동차 중 2022년 11월 1일부터 2022년 11월 30일까지 대여 가능하고 
-- 30일간의 대여 금액이 50만원 이상 200만원 미만인 자동차에 대해서 자동차 ID, 자동차 종류, 대여 금액(컬럼명: FEE) 리스트를 출력하는 SQL문을 작성해주세요. 
-- 결과는 대여 금액을 기준으로 내림차순 정렬하고, 대여 금액이 같은 경우 자동차 종류를 기준으로 오름차순 정렬, 자동차 종류까지 같은 경우 자동차 ID를 기준으로 내림차순 정렬해주세요.

-- VER1
-- 가상의 테이블 만들기 WITH문 
WITH CAR_DISCOUNT_RATE AS 
(
    SELECT
        C.CAR_ID,
        C.CAR_TYPE,
        C.DAILY_FEE,
        P.DISCOUNT_RATE
    FROM
        CAR_RENTAL_COMPANY_CAR C
        JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN P ON C.CAR_TYPE = P.CAR_TYPE
    WHERE
        C.CAR_TYPE IN ('세단', 'SUV')
        AND P.DURATION_TYPE = '30일 이상'
)

SELECT
    R.CAR_ID,
    R.CAR_TYPE,
    ROUND(R.DAILY_FEE * (1 - R.DISCOUNT_RATE / 100) * 30) AS FEE
FROM
    CAR_DISCOUNT_RATE R
WHERE  -- LEFT JOIN과 IS NULL 조건을 사용하여 대여 기록이 없거나 대여 중인 날짜가 11월 1일부터 11월 30일까지에 해당하지 않는 차량을 선택
    NOT EXISTS (
        SELECT 1
        FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY H
        WHERE R.CAR_ID = H.CAR_ID
          AND H.START_DATE <= TO_DATE('2022-11-30', 'YYYY-MM-DD')
          AND H.END_DATE >= TO_DATE('2022-11-01', 'YYYY-MM-DD')
    )
    AND R.DAILY_FEE * (1 - R.DISCOUNT_RATE / 100) * 30 >= 500000
    AND R.DAILY_FEE * (1 - R.DISCOUNT_RATE / 100) * 30 < 2000000
ORDER BY
    FEE DESC, R.CAR_TYPE ASC, R.CAR_ID DESC;

-- VER2
-- WITH CAR_DISCOUNT_RATE AS 
-- (
--     SELECT C.CAR_ID, C.CAR_TYPE, C.DAILY_FEE, P.DISCOUNT_RATE
--     FROM CAR_RENTAL_COMPANY_CAR C, CAR_RENTAL_COMPANY_DISCOUNT_PLAN P
--     WHERE C.CAR_TYPE = P.CAR_TYPE
--     AND C.CAR_TYPE IN ('세단','SUV')
--     AND P.DURATION_TYPE = '30일 이상'
-- )
-- -- LEFT JOIN으로 11월 1일 - 11월 30일까지 검색하여 거기서 car_id가 null인 경우 대여이력이 없는것만 추출
-- SELECT DISTINCT(R.CAR_ID), R.CAR_TYPE, R.DAILY_FEE*((100-R.DISCOUNT_RATE)*0.01*30) AS FEE
-- FROM CAR_DISCOUNT_RATE R LEFT JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY H ON R.CAR_ID = H.CAR_ID
--                                                 AND H.START_DATE <= TO_DATE('2022-11-30', 'YYYY-MM-DD')
--                                                 AND H.END_DATE >= TO_DATE('2022-11-01', 'YYYY-MM-DD')
-- WHERE
--     H.CAR_ID IS NULL
-- AND R.DAILY_FEE*((100-R.DISCOUNT_RATE)*0.01*30) < 2000000 
-- AND R.DAILY_FEE*((100-R.DISCOUNT_RATE)*0.01*30) >= 500000
-- ORDER BY FEE DESC, R.CAR_TYPE DESC, R.CAR_ID DESC