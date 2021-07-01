import Foundation

func solution(_ record:[String]) -> [String] {
  // uid와 id를 저장할 딕셔너리
    var user: [String:String] = [:]
    var ans: [String] = []
    
    for i in record {
        let tmp = i.components(separatedBy: " ")
      // 최종id를 딕셔너리에 저장
        if tmp.count > 2 {
            user[tmp[1]] = tmp[2]
        }
    }
    
    for i in record {
        let tmp = i.components(separatedBy: " ")
        let id = user[tmp[1]]!
        
        if tmp[0] == "Enter" {
            ans.append("\(id)님이 들어왔습니다.")
        } else if tmp[0] == "Leave" {
            ans.append("\(id)님이 나갔습니다.")
        }
    }
    return ans
}
