import Foundation

let N = Int(readLine()!)!
var result: [Int] = []

for _ in 0..<N {
    let M = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    var arr = [[Int]](repeating: [Int](repeating: 0, count: M[0]), count: M[1])
  
    for _ in 0..<M[2] {
        let loc = readLine()!.components(separatedBy: " ").map{ Int($0)! }
        arr[loc[1]][loc[0]] = 1
    }

    var count = 0
    var visit = [[Int]](repeating: [Int](repeating: 0, count: M[0]), count: M[1])
    let nextR = [-1, 0, 1, 0]
    let nextC = [0, 1, 0, -1]

  // 깊이 우선 탐색 (네 방향을 탐색하여 배추가 심어져 있다면 1마리로 보호 가능)
    func dfs(_ R: Int, _ C: Int) {
        if visit[R][C] == 1 {
            return
        }
        visit[R][C] = 1
        if arr[R][C] == 1 {
            for i in 0..<4 {
                let nR = R + nextR[i]
                let nC = C + nextC[i]
                if nR >= 0 && nR < M[1] && nC >= 0 && nC < M[0] {
                    dfs(nR, nC)
                }
            }
        }
    }

  // dfs가 실행되는 횟수 만큼 지렁이 필요
    for i in 0..<M[1] {
        for j in 0..<M[0] {
            if visit[i][j] == 0 && arr[i][j] == 1 {
                dfs(i, j)
                count += 1
            }
        }
    }
    result.append(count)
}

for i in result {
    print(i)
}
