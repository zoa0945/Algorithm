import Foundation

let N = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let M = readLine()!.split{ $0 == " " }.map{ Int($0)! }
var visit = [Int](repeating: 0, count: N[0])
var edges: [(Int, Int)] = []
var party: [[Int]] = []

for _ in 0..<N[1] {
    let p = readLine()!.split{ $0 == " " }.map{ Int($0)! }
    party.append(p)
  // 진실을 알고 있는 사람이 2명 이상일 때
    if p[0] > 1 {
        for i in 1..<p.count - 1 {
            edges.append((p[i], p[i + 1]))
            edges.append((p[i + 1], p[i]))
        }
    }
}

// 파티에 참석한 사람이 2명 이상일 때
if M[0] > 2 {
    for i in 1..<M.count - 1 {
        edges.append((M[i], M[i + 1]))
        edges.append((M[i + 1], M[i]))
    }
}

// 파티에 진실을 알고 있는 사람이 1명이라도 있을 경우 모두에게 진실을 말해야 함
func dfs(_ n: Int) {
    visit[n - 1] = 1
    for edge in edges {
        if visit[edge.1 - 1] == 0 && edge.0 == n {
            dfs(edge.1)
        }
    }
}

if M[0] == 0 {
    print(N[1])
} else {
    var cnt = 0
    for i in 1..<M.count {
        if visit[M[i] - 1] == 0 {
            dfs(M[i])
        }
    }
  // 파티에 참석한 사람이 모두 진실을 모를 경우만 체크
    for i in party {
        var chk = true
        for j in 1..<i.count {
            if visit[i[j] - 1] == 1 {
                chk = false
                break
            }
        }
        if chk {
            cnt += 1
        }
    }
    print(cnt)
}
