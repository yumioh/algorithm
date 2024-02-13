#레스토랑의 일일 평균 매출을 계산
select
  round(sum(bill) / 4,2) as avg_sales
from
  (
    select
      sum(total_bill) as bill
    from
      tips
    group by
      day
  )