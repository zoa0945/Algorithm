import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
  // 모든 사람이 심사받는 시간의 최소값
    var left = 1
  // 모든 사람이 심사받는 시간의 최대값
    var right = n * times.max()!
    var answer: Int64 = 1000000000
    
    while left <= right {
      // 중간값
        let middle = (left + right) / 2
      // middle 시간동안 심사할 수 있는 사람의 수
        var cnt = 0
        for time in times {
            cnt += middle / time
        }
        if cnt >= n {
            right = middle - 1
            answer = Int64(middle)
        } else {
            left = middle + 1
        }
    }
    return answer
}
