#정수가 담긴 리스트 num_list가 주어집니다. num_list의 홀수만 순서대로 이어 붙인 수와 
#짝수만 순서대로 이어 붙인 수의 합을 return하도록 solution 함수를 완성해주세요.

def solution(num_list):
    answer = 0
    even = ""
    odd = ""
    for value in num_list:
        if value%2 == 0: #짝수
            even += str(value)
        elif value%2 == 1: #홀수
            odd += str(value)
    answer = int(odd)+int(even) #더하기
    return answer