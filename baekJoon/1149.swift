import Foundation

let N = Int(readLine()!)!
var cost: [[Int]] = []
var allPrice = [[Int]](repeating: [Int](repeating: 0, count: 3), count: N)
var answer = 0

for _ in 1...N {
    let num = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    cost.append(num)
}

allPrice[0][0] = cost[0][0]
allPrice[0][1] = cost[0][1]
allPrice[0][2] = cost[0][2]

// 각 색깔별로 다음 집은 나머지 두색깔 중 낮은 비용을 더해 나감
for i in 1..<cost.count {
    allPrice[i][0] = cost[i][0] + [allPrice[i-1][1], allPrice[i-1][2]].min()!
    allPrice[i][1] = cost[i][1] + [allPrice[i-1][0], allPrice[i-1][2]].min()!
    allPrice[i][2] = cost[i][2] + [allPrice[i-1][0], allPrice[i-1][1]].min()!
}

// 세가지 방법 중 가장 낮은 비용을 선택
answer = allPrice[N-1].min()!
print(answer)
