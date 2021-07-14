import Foundation

func solution(_ name:String) -> Int {
    let alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map{ String($0) }
    var res = 0
    let name = name.map{ String($0) }
    var cnt = name.count - 1
    
  // 조이스틱을 위, 아래로 조작하는 횟수
    for i in 0..<name.count {
        let idx = alpha.firstIndex(of: String(name[i]))!
        if idx > 13 {
            res += 26 - idx
        } else {
            res += idx
        }
    }
    
  // 조이스틱을 양 옆으로 조작하는 횟수
    var allA = true
    for i in 0..<name.count {
        if name[i] != "A" {
            allA = false
            var next = i + 1
            while next < name.count && name[next] == "A" {
                next += 1
            }
            let moveCnt = 2 * i + name.count - next
            cnt = min(cnt, moveCnt)
        }
        
    }
    
  // 문자가 모두 "A"일때는 조작하지 않아도 됨
    if allA {
        cnt = 0
    }

    return res + cnt
}
