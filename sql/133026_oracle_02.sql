--성분으로 구분한 아이스크림 총 주문량
SELECT A.INGREDIENT_TYPE, SUM(B.TOTAL_ORDER)
FROM ICECREAM_INFO A, FIRST_HALF B
WHERE A.FLAVOR = B.FLAVOR
GROUP BY A.INGREDIENT_TYPE