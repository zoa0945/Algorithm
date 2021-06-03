import Foundation

let N = readLine()!.split{ $0 == " " }.map{ Int($0)! }
var map: [[Int]] = []

for _ in 0..<N[0] {
    map.append(readLine()!.map{ Int(String($0))! })
}

let K = Int(readLine()!)!
var ans = 0

for i in 0..<map.count {
    var zero = 0
  // 꺼져있는 램프의 개수 확인
    for j in map[i] {
        if j == 0 {
            zero += 1
        }
    }
    var cnt = 0
  // 꺼진 램프의 개수가 스위치를 누를 수 있는 횟수보다 작거나 같아야 함
  // 꺼진 램프의 개수와 스위치를 누를 수 있는 횟수가 모두 짝수이거나 홀수여야 함
    if zero <= K && zero % 2 == K % 2 {
        for j in 0..<map.count {
            if map[i] == map[j] {
                cnt += 1
            }
        }
        ans = max(ans, cnt)
    }
}

print(ans)
