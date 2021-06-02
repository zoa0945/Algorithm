import Foundation

let N = Int(readLine()!)!

// 문제에서 제시한 패턴인지 아닌지 구분하는 함수
func pattern(_ str: String) -> Bool {
    var state = 0
    for i in str {
        if let nextState = next(i, state) {
            state = nextState
        } else {
            return false
        }
    }
    if [0, 3, 6, 7].contains(state) {
        return true
    } else {
        return false
    }
}

// 오토마타 전이 그래프 (DFA) 사용
func next(_ i: Character, _ state: Int) -> Int? {
    if i == "0" {
        switch state {
        case 0: return 1
        case 1: return nil
        case 2: return 4
        case 3: return 1
        case 4: return 5
        case 5: return 5
        case 6: return 1
        case 7: return 8
        case 8: return 5
        default: return nil
        }
    } else {
        switch state {
        case 0: return 2
        case 1: return 3
        case 2: return nil
        case 3: return 2
        case 4: return nil
        case 5: return 6
        case 6: return 7
        case 7: return 7
        case 8: return 0
        default: return nil
        }
    }
}

for _ in 0..<N {
    let str = readLine()!
    if pattern(str) {
        print("YES")
    } else {
        print("NO")
    }
}
