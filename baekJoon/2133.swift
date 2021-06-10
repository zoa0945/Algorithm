import Foundation

let N = Int(readLine()!)!

var dp = [Int](repeating: 0, count: N + 1)
dp[0] = 1

// 3*1의 경우는 만들 수 없으므로 3*2부터 체크
if N >= 2 {
    dp[2] = 3
}

// N이 홀수일 경우는 타일을 체울 수 없음
if N >= 2 && N % 2 == 0 {
    for i in stride(from: 4, through: N, by: 2) {
        dp[i] = dp[i - 2] * 3
        for j in stride(from: 4, through: i, by: 2) {
            dp[i] += dp[i - j] * 2
        }
    }
}

print(dp[N])
