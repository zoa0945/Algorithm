import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var com: [String:[String]] = [:]
  // 의상 종류별로 저장
    for i in clothes {
        if com[i[1]] == nil {
            com[i[1]] = [i[0]]
        } else {
            com[i[1]]!.append(i[0])
        }
    }
    
    var res = 1
  // 종류가 한가지 이상일 때
    if com.count > 1 {
        for i in com {
          // 종류별로 0개~개수 만큼 선택 가능
            res *= i.value.count + 1
        }
    } else {
        res = clothes.count + 1
    }
    
  // 아무것도 선택하지 않은 경우 제외
    return res - 1
}
