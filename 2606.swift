import Foundation

let N = Int(readLine()!)!
let M = Int(readLine()!)!
var arr = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)

for _ in 0..<M {
    let edges = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    arr[edges[0] - 1][edges[1] - 1] = 1
    arr[edges[1] - 1][edges[0] - 1] = 1
}

var visit = [Int](repeating: 0, count: N)
var queue: [Int] = []
var answer: [Int] = []

func bfs(_ a: Int) {
    queue.append(a)
    while !queue.isEmpty {
        let vertex = queue.removeFirst()
        visit[vertex - 1] = 1
        answer.append(vertex)
        for i in 1...N {
            if visit[i - 1] == 0 && arr[vertex - 1][i - 1] == 1 && !queue.contains(i) {
                queue.append(i)
            }
        }
    }
}

bfs(1)

print(answer.count - 1)
