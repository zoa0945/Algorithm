import Foundation

// 소수인지 아닌지 체크하기 위한 함수
func check(_ num: Int) -> Bool {
    if num < 2 {
        return false
    }
    var i = 2
    while i <= num / 2 {
        if num % i == 0 {
            return false
        }
        i += 1
    }
    return true
}

func solution(_ numbers: String) -> Int {
    let num = numbers.map{ String($0) }
    var visit = [Int](repeating: 0, count: num.count)
    var res: [Int] = []
    var number = ""
    
    func dfs(_ depth: Int, _ str: String, _ cnt: Int) {
      // 사용한 문자의 개수가 사용할 문자의 개수와 같을 때
        if depth == cnt {
            if let number = Int(str) {
              // 만들어진 문자열이 소수이고 res에 포함되어 있지 않을 때
                if check(number) && !res.contains(number) {
                    res.append(number)
                }
            }
        } else {
            for i in 0..<num.count {
                if visit[i] == 0 {
                    number += num[i]
                    visit[i] = 1
                    dfs(depth + 1, number, cnt)
                  // 백트래킹을 위한 초기화
                    visit[i] = 0
                    number = str
                }
            }
        }
    }
    
    for i in 1...num.count {
        dfs(0, "", i)
    }
    
    return res.count
}
