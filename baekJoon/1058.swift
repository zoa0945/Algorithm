import Foundation

let N = Int(readLine()!)!
var map: [[String]] = []

for _ in 0..<N {
    map.append(readLine()!.map{ String($0) })
}

var friend = [Int](repeating: 0, count: N)

for i in 0..<map.count {
    for j in i + 1..<map.count {
      // 둘이 친구라면 2-친구 +1
        if map[i][j] == "Y" {
            friend[i] += 1
            friend[j] += 1
        } else {
          // 둘이 친구가 아니면 같이 아는 친구가 있을 때 2-친구 +1
            for k in 0..<map.count {
                if map[i][k] == "Y", map[j][k] == "Y" {
                    friend[i] += 1
                    friend[j] += 1
                    break
                }
            }
        }
    }
}

print(friend.max()!)
