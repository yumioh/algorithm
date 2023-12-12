--조건에 부합하는 중고거래 상태 조회하기
--다음은 중고거래 게시판 정보를 담은 USED_GOODS_BOARD 테이블입니다. 
--USED_GOODS_BOARD 테이블은 다음과 같으며 BOARD_ID, WRITER_ID, TITLE, CONTENTS, PRICE, CREATED_DATE, 
--STATUS, VIEWS은 게시글 ID, 작성자 ID, 게시글 제목, 게시글 내용, 가격, 작성일, 거래상태, 조회수를 의미합니다.

-- 문제
-- USED_GOODS_BOARD 테이블에서 2022년 10월 5일에 등록된 중고거래 
--게시물의 게시글 ID, 작성자 ID, 게시글 제목, 가격, 거래상태를 조회하는 SQL문을 작성해주세요. 
--거래상태가 SALE 이면 판매중, RESERVED이면 예약중, DONE이면 거래완료 분류하여 출력해주시고, 
--결과는 게시글 ID를 기준으로 내림차순 정렬해주세요.

SELECT BOARD_ID
      ,WRITER_ID
      ,TITLE
      ,PRICE
,CASE STATUS
    WHEN 'RESERVED' THEN '예약중'
    WHEN 'SALE' THEN '판매중'
    ELSE '거래완료'
END AS STATUS FROM USED_GOODS_BOARD
WHERE DATE_FORMAT(CREATED_DATE,'%Y%m%d') = 20221005
ORDER BY BOARD_ID DESC