import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
  // 0: 방문 한 노드인지 확인, 1: 1과의 거리
    var visit = [(Int,Int)](repeating: (0,0), count: n)
    var queue: Set = [1]
    var edges = [[Int]](repeating: [Int](), count: n + 1)
    for e in edge {
        edges[e[0]].append(e[1])
        edges[e[1]].append(e[0])
    }
    
    while !queue.isEmpty {
      // 거리가 같은 노드들의 집합
        var nodes = Set<Int>()
        for i in queue {
            visit[i - 1].0 = 1
        }
        for node in queue {
          // 연결된 노드 확인
            for num in edges[node] {
                if visit[num - 1].0 == 0 {
                    visit[num - 1].0 = 1
                  // 연결되어 있다면 거리가 1 더 멀어짐
                    visit[num - 1].1 = visit[node - 1].1 + 1
                    nodes.insert(num)
                }
            }
        }
        queue = nodes
    }
  // 거리 순으로 정렬
    let dist = visit.sorted { n1, n2 in
        return n1.1 > n2.1
    }[0].1
  
  // 거리가 같은 노드들의 개수
    return visit.filter{ $0.1 == dist }.count
}
