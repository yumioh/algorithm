#01 알고리즘 기초

#알고리즘 : 어떠한 문제를 해결하기 위해 정해 놓은 일련의 절차

#실습1-1
#세 정수를 입력받아 최댓값 구하기 

# 조건식으로 평가한 결과에 따라 프로그램의 실행 흐름이 변경되는데 이러한 구조를 선택구조
# print("세 정수를 입력하시오 >> ")
# a = int(input("첫번째 정수를 입력하시요 : ")) #input은 키보드로 문자열을 입력받아 반환
# b = int(input("두번째 정수를 입력하시요 : "))
# c = int(input("세번째 정수를 입력하시요 : "))

# maxNum = a

# if b > maxNum:
#     maxNum = b
# if c > maxNum:
#     maxNum = c

# print("최대값은 : ", maxNum)

#숫자로 변환 할 수 없는 문자열을 int(), float() 함수에 전달하면 int('H2O'), float('5x.2')등 오류가 발생

#실습 1-2
#함수를 활용하여 세 정수의 최대값 구하기 
def max3(a, b, c) :
    maxNum = a
    if b > maxNum:
        maxNum = b
    if c > maxNum:
        maxNum = c
    return maxNum

print('최대값은 : ', max3(1,3,2))
print('최대값은 : ', max3(10,3,2))
print('최대값은 : ', max3(111,22,77))

#세 정수의 대소 관계 나열하기 
#a,b,c의 대소관계를 나무처럼 조합한 모양을 결정 트리
#결정 트리는 왼쪽 끝에서 시작하여, 오른쪽으로 나아감. 조건이 성립하면 위쪽 선을 따라가고, 성립하지 않으면 아래쪽선을 따라감

#세 정수의 중간 값 구하기 

def med(a,b,c) :
    if  a >=b :
        if b >= c :
            return b
        elif a <= c :
            return a 
        else:
            return c
    elif a > c :
        return a
    elif b > c :
        return c
    else:
        return b

a =  int(input("첫번째 정수를 입력하세요 : "))
b =  int(input("두번째 정수를 입력하세요 : "))
c =  int(input("세번째 정수를 입력하세요 : "))

print("중간값은 : ", med(a,b,c))

