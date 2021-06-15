import Foundation

let N = Int(readLine()!)!
var times: [(Int,Int)] = []
var endtime = -1
var count = 0

for _ in 0..<N {
    let time = readLine()!.components(separatedBy: " ").map { Int($0)! }
    times.append((time[0], time[1]))
}

// 회의시간을 끝나는 시간에 따라 정렬
let meet = times.sorted { arr1, arr2 in
    if arr1.1 == arr2.1 {
        return arr1.0 < arr2.0
    } else {
        return arr1.1 < arr2.1
    }
}

// 회의가 끝나는 시간이 다음 회의 시작시간보다 빠르면 카운트 +1
for m in meet {
    if endtime <= m.0 {
        count += 1
        endtime = m.1
    }
}

print(count)
