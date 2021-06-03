import Foundation

let N = readLine()!.split{ $0 == " " }.map{ Int($0)! }
var ans: [Int] = []

for i in N[1]...100 {
  // 중간값 지정
    let mid = N[0] / i
  // 홀수개의 경우
    if i % 2 == 1 {
        for j in mid - (i / 2)...mid + (i / 2) {
          // 0 보다 작으면 안됨
            if j < 0 {
                break
            }
            ans.append(j)
        }
      // 수열의 합 확인
        if ans.reduce(0, +) == N[0] {
            break
        } else {
            ans = []
        }
   // 짝수개의 경우
    } else {
        for j in mid - (i / 2) + 1...mid + (i / 2) {
            if j < 0 {
                break
            }
            ans.append(j)
        }
        if ans.reduce(0, +) == N[0] {
            break
        } else {
            ans = []
        }
    }
}

if ans.count > 0 {
    for i in ans {
        print(i, "", separator: " ", terminator: "")
    }
} else {
    print(-1)
}
