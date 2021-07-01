import Foundation

// 최대공약수를 구하는 함수
func gcd(_ a: Int, _ b: Int) -> Int {
    let mod = a % b
  // 나머지가 0일 경우 a와 b 중 작은 수
  // 나머지가 0이 아닐 경우 b와 나머지로 재귀
    return mod == 0 ? min(a, b) : gcd(b, mod)
}

func solution(_ w:Int, _ h:Int) -> Int64{
    var answer: Int64 = 0
    let all: Int64 = Int64(w) * Int64(h)
    
    let numGcd = gcd(w, h)
    
  // 전체 사각형의 개수에서 (가로 + 세로 - 최대공약수)를 뺀 값
    answer = all - Int64(w + h - numGcd)
    return answer
}
