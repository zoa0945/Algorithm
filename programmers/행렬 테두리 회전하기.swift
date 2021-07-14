import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var res: [Int] = []
    var map = [[Int]](repeating: [Int](repeating: 0, count: columns), count: rows)
    
    for i in 0..<map.count {
        for j in 0..<map[i].count {
            map[i][j] = i * columns + j + 1
        }
    }
    
  // 행렬을 회전시키고 그 범위에 속한 값 중 가장 작은값을 반환
    func rotate(_ query: [Int]) -> Int {
        var res: [Int] = []
        let tmp = map[query[0] - 1][query[1] - 1]
        res.append(tmp)
        for i in query[0]..<query[2] {
            res.append(map[i][query[1] - 1])
            map[i - 1][query[1] - 1] = map[i][query[1] - 1]
        }
        for i in query[1]..<query[3] {
            res.append(map[query[2] - 1][i])
            map[query[2] - 1][i - 1] = map[query[2] - 1][i]
        }
        for i in stride(from: query[2] - 2, through: query[0] - 1, by: -1) {
            res.append(map[i][query[3] - 1])
            map[i + 1][query[3] - 1] = map[i][query[3] - 1]
        }
        for i in stride(from: query[3] - 2, through: query[1], by: -1) {
            res.append(map[query[0] - 1][i])
            map[query[0] - 1][i + 1] = map[query[0] - 1][i]
        }
        map[query[0] - 1][query[1]] = tmp
        return res.min()!
    }
    
    for query in queries {
        res.append(rotate(query))
    }
    return res
}
