import Foundation

let N = readLine()!.split{ $0 == " " }.map{ Int($0)! }
var cnt = 1
let n1 = min(N[1], N[2])
let n2 = max(N[1], N[2])

// 다음 라운드에서의 번호
func next(_ n: Int) -> Int {
    var res = 0
    if n % 2 == 1 {
        res = n / 2 + 1
    } else {
        res = n / 2
    }
    return res
}

func rec(_ n1: Int, _ n2: Int) {
    if n1 % 2 == 1 && n1 + 1 == n2 {
        return
    } else {
        cnt += 1
        rec(next(n1), next(n2))
    }
}

rec(n1, n2)
print(cnt)
