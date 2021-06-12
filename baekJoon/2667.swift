import Foundation

let N = Int(readLine()!)!
var arr = [[Character]](repeating: [Character](), count: N)

for i in 0..<N {
    let addr = readLine()!
    for s in addr {
        arr[i].append(s)
    }
}

var visit = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
var count = 0
var result: [Int] = []
// 4방향 확인용
let nextR = [-1, 0, 1, 0]
let nextC = [0, 1, 0, -1]

func dfs(_ R: Int, _ C: Int) {
    if visit[R][C] == 1 {
        return
    }
    visit[R][C] = 1
    if arr[R][C] == "1" {
        count += 1
        for i in 0..<4 {
            let nR = R + nextR[i]
            let nC = C + nextC[i]
            if nR >= 0 && nR < N && nC >= 0 && nC < N {
                dfs(nR, nC)
            }
        }
    }
}

for i in 0..<N {
    for j in 0..<N {
        if visit[i][j] == 0 && arr[i][j] == "1" {
            count = 0
            dfs(i, j)
          // dfs 실행 시 붙어있는 단지 횟수 저장
            result.append(count)
        }
    }
}

print(result.count)
for i in result.sorted(by: <) {
    print(i)
}
