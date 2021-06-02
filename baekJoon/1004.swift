import Foundation

let N = Int(readLine()!)!

// 해당 지점이 원의 외부에 있는지 내부에 있는지 체크하는 함수
func chk(_ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int, _ dist: Int) -> Bool {
    let x = x1 - x2
    let y = y1 - y2
    if pow(Double(x), 2) + pow(Double(y), 2) < pow(Double(dist), 2) {
        return true
    }
    return false
}

for _ in 0..<N {
    var ans = 0
    let cord = readLine()!.split(separator: " ").map{ Int($0)! }
    let cnt = Int(readLine()!)!
    var circle: [[Int]] = []
    for _ in 0..<cnt {
        circle.append(readLine()!.split(separator: " ").map{ Int($0)! })
    }
    for i in circle {
        var c1 = false
        var c2 = false
        if chk(cord[0], cord[1], i[0], i[1], i[2]) {
            c1 = true
        }
        if chk(cord[2], cord[3], i[0], i[1], i[2]) {
            c2 = true
        }
      // 한 점은 외부에 있고 다른 한 점은 내부에 있다면 경계선을 지나야 함
        if (c1 && !c2) || (!c1 && c2) {
            ans += 1
        }
    }
    print(ans)
}
