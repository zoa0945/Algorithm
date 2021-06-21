import Foundation

let N = readLine()!.components(separatedBy: " ").map{ Int($0)! }
// 간선을 담을 배열
var arr = [[Int]](repeating: [Int](repeating: 0, count: N[0]), count: N[0])

for _ in 0..<N[1] {
    let edge = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    arr[edge[0] - 1][edge[1] - 1] = 1
    arr[edge[1] - 1][edge[0] - 1] = 1
}

var visit = [Int](repeating: 0, count: N[0])

func dfs(_ num: Int) {
    visit[num - 1] = 1
    for i in 1...N[0] {
        if visit[i - 1] == 0 && arr[num - 1][i - 1] == 1 {
            dfs(i)
        }
    }
}

var cnt = 0

// dfs가 실행 되는 횟수 체크
for i in 1...N[0] {
    if visit[i - 1] == 0 {
        dfs(i)
        cnt += 1
    }
}

print(cnt)
