import Foundation

func solution(_ s: String) -> Int {
  // 짝지어지지 않은 문자를 저장해놓을 배열
    var arr: [String] = []
    var now = ""
  // 문자가 홀수개면 완전 제거 불가
    if s.count % 2 == 1 {
        return 0
    } else {
        for i in s {
          // 이전의 문자와 같을 때 제거 가능하므로 남은 문자로 변경
            if String(i) == now {
                if !arr.isEmpty {
                    now = arr.removeLast()
                }
            } else {
              // 제거가 안될 경우 배열에 저장
                arr.append(now)
                now = String(i)
            }
        }
      // 모두 제거 된 경우
        if now == "" {
            return 1
        } else {
            return 0
        }
    }
}
