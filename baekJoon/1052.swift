import Foundation

var N = readLine()!.split{ $0 == " " }.map{ Int($0)! }

var tmp: [Int] = []

while N[0] > 0 {
    tmp.append(N[0] % 2)
    N[0] /= 2
}

var cnt = 0

// 물병을 사거나 합친 후 물병 개수 조정
func buy(_ idx: Int) {
    if idx == tmp.count - 1 {
        if tmp[idx] == 2 {
            tmp[idx] = 0
        }
        return
    } else {
        if tmp[idx] == 2 {
            tmp[idx] = 0
            tmp[idx + 1] += 1
        }
        buy(idx + 1)
    }
}

// 물병의 총 합이 N[1]보다 작거나 같을때까지 진행
while tmp.reduce(0, +) > N[1] {
    let idx = tmp.firstIndex(of: 1)!
    tmp[idx] += 1
    cnt += Int(pow(Double(2), Double(idx)))
    buy(idx)
}

print(cnt)
