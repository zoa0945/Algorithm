import Foundation

while true {
    let N = readLine()!.components(separatedBy: " ").map{ Int($0)! }
  // 지도의 너비와 높이가 0이면 중지
    if N[0] == 0 && N[1] == 0 {
        break
    }
    
    var map: [[Int]] = []

    for _ in 0..<N[1] {
        let arr = readLine()!.components(separatedBy: " ").map{ Int($0)! }
        map.append(arr)
    }
  // 8방향 확인용
    let dir = [(-1, 1), (0, 1), (1, 1), (1, 0), (1, -1), (0, -1), (-1, -1), (-1, 0)]

    var visit = [[Int]](repeating: [Int](repeating: 0, count: N[0]), count: N[1])

    func dfs(_ r: Int, _ c: Int) {
        visit[r][c] = 1
        for i in 0..<8 {
            let nr = r + dir[i].0
            let nc = c + dir[i].1
          // 8방향 확인 후 지도의 값이 1이면 다음 진행
            if nr >= 0 && nc >= 0 && nr < N[1] && nc < N[0] &&
                map[nr][nc] == 1 && visit[nr][nc] == 0 {
                    dfs(nr, nc)
            }
        }
    }

    var cnt = 0

    for i in 0..<N[1] {
        for j in 0..<N[0] {
            if map[i][j] == 1 && visit[i][j] == 0 {
                dfs(i, j)
                cnt += 1
            }
        }
    }

    print(cnt)
}
