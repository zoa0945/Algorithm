import Foundation

// 올바른 괄호 문자열인지 확인
func chk(_ p: String) -> Bool {
    if p.isEmpty {
        return true
    }
    var p = p
    var tmp: [String] = []
    while !p.isEmpty {
        let s = String(p.removeFirst())
        if tmp.isEmpty {
            tmp.append(s)
          // "("와 ")"가 짝을 이루면 제거
        } else if tmp.last! == "(" && s == ")" {
            tmp.removeLast()
        } else {
            tmp.append(s)
        }
    }
    return tmp.isEmpty
}

func solution(_ p: String) -> String {
    if p.isEmpty {
        return ""
    } else if chk(p) {
        return p
    } else {
        var v = p
        var u = String(v.removeFirst())
      // 균형잡힌 괄호 문자열 u와 v 만들어 주기
        while u.filter({ $0 == "(" }).count != u.filter({ $0 == ")" }).count {
            let s = v.removeFirst()
            u.append(s)
        }
      // u가 올바른 괄호 문자열인 경우 v로 재귀
        if chk(u) {
            return u + solution(v)
        } else {
          // 지문에 나온 절차대로 진행
          // 4-1, 4-2, 4-3
            let tmp = "(" + solution(v) + ")"
          // 4-4
            u.removeFirst()
            u.removeLast()
            u = u.map{ if $0 == "(" {
                return ")"
            } else {
                return "("
            }}.reduce("") { $0 + $1 }
            return tmp + u
        }
    }
}
