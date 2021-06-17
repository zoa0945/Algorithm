import Foundation

let N = Int(readLine()!)!
var res = [Int](repeating: 0, count: N + 1)

for i in 2..<N + 1 {
    res[i] = res[i - 1] + 1
    if i % 3 == 0 {
        res[i] = min(res[i], res[i / 3] + 1)
    }
    if i % 2 == 0 {
        res[i] = min(res[i], res[i / 2] + 1)
    }
}

print(res[N])
