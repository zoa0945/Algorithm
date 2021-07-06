import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    if progresses.isEmpty {
        return []
    } else if progresses.count == 1 {
        return [1]
    }
  // 남은 작업의 진도
    let pro = progresses.map{ 100 - $0 }
    var time: [Int] = []
    for i in 0..<pro.count {
      // 작업이 완료되는데 걸리는 시간
        time.append(Int(ceil(Double(pro[i]) / Double(speeds[i]))))
    }

    var ans: [Int] = []
    var cnt = 1
  // 현재 작업이 끝날때까지 걸리는 시간
    var val1 = time.removeFirst()
    while !time.isEmpty {
      // 다음 작업이 끝날때까지 걸리는 시간
        let val2 = time.removeFirst()
      // 다음 작업이 끝나는 시간이 현재 작업이 끝나는 시간보다 길 때
        if val2 > val1 {
            ans.append(cnt)
            cnt = 1
            val1 = val2
       // 다음 작업이 현재 작업보다 빨리 끝날 때
        } else {
            cnt += 1
        }
    }
    ans.append(cnt)
    return ans
}
