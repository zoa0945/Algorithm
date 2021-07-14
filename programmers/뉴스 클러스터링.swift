func solution(_ str1:String, _ str2:String) -> Int {
  // 문자열을 모두 소문자로 변경
    var line1 = Array(str1.lowercased())
    var line2 = Array(str2.lowercased())
    
  // 두글자씩 끊어 단어가 몇번 나왔는지 체크할 딕셔너리
    var arr1: [String: Int] = [:]
    var arr2: [String: Int] = [:]
    
  // 첫번째 문자열을 두글자씩 끊어 딕셔너리에 저장
    var idx = 0
    while idx < line1.count - 1 {
        if line1[idx].isLetter && line1[idx + 1].isLetter {
            let word = String(line1[idx]) + String(line1[idx + 1])
            if arr1[word] == nil {
                arr1[word] = 1
            } else {
                arr1[word]! += 1
            }
        }
        idx += 1
    }
    
  // 두번째 문자열을 두글자씩 끊어 딕셔너리에 저장
    idx = 0
    while idx < line2.count - 1 {
        if line2[idx].isLetter && line2[idx + 1].isLetter {
            let word = String(line2[idx]) + String(line2[idx + 1])
            if arr2[word] == nil {
                arr2[word] = 1
            } else {
                arr2[word]! += 1
            }
        }
        idx += 1
    }
    
    var A = 0
    var B = 0
  
  // 단어가 두개의 딕셔너리에 모두 있을 때
    for i in arr1 {
        if let word = arr2[i.key] {
          // 교집합의 개수
            A += min(word, i.value)
          // 합집합의 개수
            B += max(word, i.value)
            arr2.removeValue(forKey: i.key)
        } else {
            B += i.value
        }
    }
    
    for i in arr2 {
        B += i.value
    }
    
    if B == 0 {
        return 65536
    }
    return Int(Double(A) / Double(B) * 65536)
}
