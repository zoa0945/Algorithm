import Foundation

let N = Int(readLine()!)!
let build = readLine()!.split{ $0 == " " }.map{ Int($0)! }
var res = [Int](repeating: 0, count: N)

for i in 0..<N {
    var tmp = [Double](repeating: 0, count: N)
  // i건물에서 j건물 사이의 기울기
    for j in 0..<N {
        if i != j {
            tmp[j] += (Double(build[j] - build[i]) / Double(j - i))
        }
    }
    var cur: Double = 1.0 * 1000000001
  // 왼쪽 건물과의 기울기를 비교하여 보이는지 체크
    for j in stride(from: i, through: 0, by: -1) {
        if i != j && tmp[j] < cur {
            cur = tmp[j]
            res[i] += 1
        }
    }
    cur = 1.0 * -1000000001
  // 오른쪽 건물과의 기울기를 비교하여 보이는지 체크
    for j in i..<N {
        if i != j && tmp[j] > cur {
            cur = tmp[j]
            res[i] += 1
        }
    }
}

print(res.max()!)
