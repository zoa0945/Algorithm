import Foundation

let N = Int(readLine()!)!
var a: [Int] = []

// 포도주의 양이 담긴 배열
for _ in 0..<N {
    a.append(Int(readLine()!)!)
}

var dp = [Int](repeating: 0, count: 10001)
dp[1] = a[0]

// 잔이 2개 이상일 때
if N >= 2 {
    dp[2] = a[0] + a[1]
}

var i = 3
while i <= N {
    dp[i] = max(dp[i - 2] + a[i - 1], dp[i - 3] + a[i - 2] + a[i - 1])
    dp[i] = max(dp[i - 1], dp[i])
    i += 1
}

print(dp[N])
