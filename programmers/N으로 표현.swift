import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
  // 사용할 숫자와 만들 숫자가 같으면 1
    if number == N { return 1 }

  // 사용할 숫자의 개수(key)마다 만들 수 있는 수(value) 저장
    var ns: [Int:[Int]] = [:]
  // 만들 숫자(key)에 사용한 숫자의 개수(value) 저장
    var chkedNum: [Int:Int] = [:]
    ns[1] = [N]
    chkedNum[N] = 1

  // 사용할 숫자(N)가 cnt개 만큼 이어져 있는 수 만들기
    func makeNum(_ N: Int, _ cnt: Int) -> Int {
        var res = 0
        for _ in 0..<cnt {
            res = res * 10 + N
        }
        return res
    }

  // ns, chkedNum 배열에 각각 추가하는 함수
    func add(_ num: Int, _ cnt: Int) {
        if chkedNum[num] == nil && num > 0 && num <= 32000 {
            ns[cnt]?.append(num)
            chkedNum[num] = cnt
        }
    }

    for i in 2...8 {
        ns[i] = []
      // 만들 숫자가 사용할 숫자를 이어붙인 수인 경우
        if number == makeNum(N, i) {
            return i
        }
        add(makeNum(N, i), i)
        for j in 1..<i {
            if let num1 = ns[j], let num2 = ns[i - j] {
                for n1 in num1 {
                    for n2 in num2 {
                        if n1 / n2 == number || n1 - n2 == number || n1 + n2 == number || n1 * n2 == number {
                            return i
                        }
                        add(n1 / n2, i)
                        add(n1 - n2, i)
                        add(n1 + n2, i)
                        add(n1 * n2, i)
                    }
                }
            }
            continue
        }
    }
    return -1
}
