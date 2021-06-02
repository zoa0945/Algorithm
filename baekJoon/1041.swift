import Foundation

let N = Int(readLine()!)!
let rec = readLine()!.split{ $0 == " " }.map{ Int($0)! }

var a1: [Int] = []

// 최대 3개의 면이 보여질 수 있으므로 마주보고 있는 값들 중 작은 값을 선택
a1.append(min(rec[0], rec[5]))
a1.append(min(rec[1], rec[4]))
a1.append(min(rec[2], rec[3]))

func ans(_ num: [Int], _ n: Int) -> Int {
    var res = 0
  // 윗면
    res += num[0] * n * n
  // 옆면의 첫번째 줄
    res += (num[1] * (n - 1) + num[2]) * 4
  // 나머지
    for _ in 0..<n - 1 {
        res += (num[0] * (n - 1) + num[1]) * 4
    }
    return res
}

if N == 1 {
    print(rec.reduce(0, +) - rec.max()!)
} else {
    print(ans(a1.sorted(by: <), N))
}
