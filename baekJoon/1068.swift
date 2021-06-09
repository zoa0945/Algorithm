import Foundation

let N = Int(readLine()!)!
let parent = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let D = Int(readLine()!)!

var edges: [(Int, Int)] = []
var start: [Int] = []

// 연결 노드 정리
// root는 start에 저장
for (i, v) in parent.enumerated() {
    if v == -1 {
        start.append(i)
        continue
    } else {
        edges.append((v, i))
    }
}

var visit = [Int](repeating: 0, count: N)
var cnt = 0

// 해당 노드가 삭제된 지점이면 반환
// 해당 노드와 연결된 노드가 삭제된 지점이 아니면 자식 개수 +1
func dfs(_ n: Int) {
    if n == D {
        return
    } else {
        visit[n] = 1
        for edge in edges {
            if visit[edge.1] == 0 && edge.0 == n {
                if edge.1 != D {
                    visit[edge.0] += 1
                }
                dfs(edge.1)
            }
        }
    }
}

for i in start {
    if visit[i] == 0 {
        dfs(i)
    }
}

// 자식 개수가 1개인 리프 노드만 필더링 하여 개수 출력
print(visit.filter{ $0 == 1 }.count)
