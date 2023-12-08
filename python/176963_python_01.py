a = 91
b = 2

print(str(a) + str(b))


def solution(a, b):
    aw1 = 2 * (a * b)
    aw2 = str(a) + str(b)
    if int(aw2) >= aw1 :
        answer = aw2
    else :
        answer = aw1
    return answer

print(solution(a,b))