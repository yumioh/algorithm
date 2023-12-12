def solution(n, k) :
    extra = 0
    # 10개 이상이고 k가 0이 아닌경우
    if n >= 10 and k != 0: 
        extra = n / 10
    food = n * 12000
    drink = (k - int(extra)) * 2000
    answer = food + drink
    return answer

