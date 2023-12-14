players = ["mumu", "soe", "poe", "kai", "mine"]
callings = ["kai", "kai", "mine", "mine"]

#시간초과 문제 해결
#index 자체가 loop이고 dict or object는 address개념


def solution(players, callings):
    player_indices = {name: i for i, name in enumerate(players)}
    
    for i in range(len(callings)):
        current_player = callings[i]
        current_idx = player_indices[current_player]
        
        # 현재 선수와 그 앞의 선수의 등수 교체
        if current_idx > 0:
            players[current_idx], players[current_idx - 1] = players[current_idx - 1], players[current_idx]
            #딕셔너리도 변경
            player_indices[players[current_idx]] = current_idx
            player_indices[players[current_idx - 1]] = current_idx - 1
        
    return players

print(solution(players, callings))