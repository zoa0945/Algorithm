import Foundation

let N = readLine()!.split(separator: " ").map{ Int(String($0))! }
var map: [[Int]] = []

for _ in 0..<N[0] {
    let arr = readLine()!.map{ Int(String($0))! }
    map.append(arr)
}

// 4방향 확인용
let dir = [(1, 0), (0, 1), (-1, 0), (0, -1)]
var visit = [[Int]](repeating: [Int](repeating: 0, count: N[1]), count: N[0])
// 해당지점까지의 거리
var distance = [[Int]](repeating: [Int](repeating: 0, count: N[1]), count: N[0])
var queue: [[Int]] = []

// 시작지점부터 인접한 네방향의 값을 확인하면서 bfs 진행
func bfs(_ r: Int, _ c: Int) {
    queue.append([r, c])
    while !queue.isEmpty {
        let chk = queue.removeFirst()
        visit[chk[0]][chk[1]] = 1
        for i in 0..<4 {
            let nr = chk[0] + dir[i].0
            let nc = chk[1] + dir[i].1
            if nr >= 0 && nc >= 0 && nr < N[0] && nc < N[1] &&
                map[nr][nc] == 1 && visit[nr][nc] == 0 && !queue.contains([nr, nc]) {
                distance[nr][nc] = distance[chk[0]][chk[1]] + 1
                queue.append([nr, nc])
            }
        }
    }
}

for i in 0..<N[0] {
    for j in 0..<N[1] {
        if map[i][j] == 1 && visit[i][j] == 0 {
            bfs(i, j)
        }
    }
}

// 첫칸을 포함해야 하므로 +1한 값을 출력
print(distance[N[0] - 1][N[1] - 1] + 1)
