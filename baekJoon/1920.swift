import Foundation

let N = Int(readLine()!)!
var A = readLine()!.components(separatedBy: " ").map{ Int($0)! }

let M = Int(readLine()!)!
let numbers = readLine()!.components(separatedBy: " ").map{ Int($0)! }

// 이분 탐색을 하기 위해 정렬
A.sort()

// 이분 탐색
func solution(_ num: Int) -> Int {
    var start = 0
    var end = N - 1
    
    while end - start >= 0 {
        let mid = (start + end) / 2
        
        if A[mid] == num {
            return 1
        } else if A[mid] > num {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    return 0
}

for i in numbers {
    print(solution(i))
}
