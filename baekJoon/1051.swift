import Foundation

let RC = readLine()!.split{ $0 == " " }.map{ Int($0)! }
var map: [[Int]] = []

for _ in 0..<RC[0] {
    map.append(readLine()!.map{ Int(String($0))! })
}

let tmp = min(RC[0], RC[1])
var ans = 0

for i in 0..<RC[0] {
    for j in 0..<RC[1] {
        for k in 1...tmp {
            if i + k < RC[0], j + k < RC[1] {
            // 네 꼭지점의 값 비교
                if map[i][j] == map[i + k][j], map[i + k][j] == map[i + k][j + k],
                   map[i + k][j + k] == map[i][j + k] {
                    if k > ans {
                        ans = k
                    }
                }
            }
        }
    }
}

ans += 1
print(ans * ans)
