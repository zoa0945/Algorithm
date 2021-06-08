import Foundation

let N = readLine()!
var str: [String] = []

for i in N.indices {
    str.append(String(N[i]))
}

func dp(_ str: [String]) -> Int {
    var dp = [Int](repeating: 1, count: str.count + 1)
    
  // 암호가 잘못된 경우 (빈 문자열이거나 첫 글자가 0인 경우)
    if str.isEmpty || str[0] == "0" {
        return 0
    }
    for i in 1..<str.count {
        if str[i] == "0" {
          // 암호가 잘못된 경우 (0의 앞 글자가 2보다 큰 경우)
            if Int(str[i - 1])! > 2 || Int(str[i - 1])! == 0 {
                return 0
            }
        }
    }
    
    if str.count > 1 {
        for i in 2...str.count {
          // 앞 글자가 0인경우 2번째 전 글자까지의 경우와 같음
            if Int(str[i - 1])! == 0 {
                dp[i] = dp[i - 2] % 1000000
          // 앞 두글자가 26보다 크거나 2번쨰 전 글자가 0인 경우 1번째 전 글자의 경우와 같음
            } else if Int(str[i - 2])! * 10 + Int(str[i - 1])! > 26 || Int(str[i - 2])! == 0 {
                dp[i] = dp[i - 1] % 1000000
            } else {
          // 나머지의 경우 1번째 전과 2번째 전의 경우를 합친것과 같음
                dp[i] = (dp[i - 1] + dp[i - 2]) % 1000000
            }
        }
    }
    return dp[str.count]
}

print(dp(str))
