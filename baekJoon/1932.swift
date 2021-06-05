import Foundation

let N = Int(readLine()!)!
var numbers: [[Int]] = [[]]
var result = 0

for _ in 1...N {
    let num = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    numbers.append(num)
}

numbers.removeFirst()

for i in 1..<N {
    for j in 0...i {
      // 양쪽 끝의 숫자가 선택되었을 때
        if j == 0 {
            numbers[i][j] = numbers[i-1][0] + numbers[i][j]
        } else if j == i {
            numbers[i][j] = numbers[i-1][j-1] + numbers[i][j]
      // 중간의 숫자가 선택되었을 때는 둘중 큰 값을 선택
        } else {
            numbers[i][j] = [numbers[i-1][j-1] + numbers[i][j], numbers[i-1][j] + numbers[i][j]].max()!
        }
    }
}

result = numbers[N-1].max()!
print(result)
