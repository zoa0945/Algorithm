func solution(_ s:String) -> Int {
    var answer = s.count
    if answer == 1 {
        return answer
    }
    
    for i in 1...s.count / 2 {
        var pos = 0
        var len = s.count
        
        while pos + i <= s.count {
            let stridx = s.index(s.startIndex, offsetBy: pos)
            let endidx = s.index(s.startIndex, offsetBy: pos + i)

          // 현재 문자열
            let unit = s[stridx..<endidx]
            pos += i
            
            var cnt = 0
            
            while pos + i <= s.count {
                let stridx2 = s.index(s.startIndex, offsetBy: pos)
                let endidx2 = s.index(s.startIndex, offsetBy: pos + i)

              // 다음 문자열
                let unit2 = s[stridx2..<endidx2]
              // 현재 문자열과 다음 문자열이 같을 때
                if unit == unit2 {
                    cnt += 1
                    pos += i
                } else {
                    break
                }
            }
            
            if cnt > 0 {
                len -= i * cnt
                
              // 문자열 앞에 붙는 숫자 확인
                if cnt < 9 {
                    len += 1
                } else if cnt < 99 {
                    len += 2
                } else if cnt < 999 {
                    len += 3
                } else {
                    len += 4
                }
            }
        }
        if len < answer {
            answer = len
        }
    }

    return answer
}
