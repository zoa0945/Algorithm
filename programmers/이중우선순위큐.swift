import Foundation

func solution(_ operations:[String]) -> [Int] {
    var oper: [[String]] = []
    for i in operations {
        oper.append(i.components(separatedBy: " "))
    }
    var tmp: [Int] = []
    var ans: [Int] = []
    
  // 각 명령어에 대한 기능 구현
    for i in oper {
        if i[0] == "I" {
            tmp.append(Int(i[1])!)
        } else if i[0] == "D" && i[1] == "1" {
            if !tmp.isEmpty {
                tmp.remove(at: tmp.firstIndex(of: tmp.max()!)!)
            }
        } else if i[0] == "D" && i[1] == "-1" {
            if !tmp.isEmpty {
                tmp.remove(at: tmp.firstIndex(of: tmp.min()!)!)
            }
        }
    }
    
    if tmp.isEmpty {
        ans = [0,0]
    } else {
        ans.append(tmp.max()!)
        ans.append(tmp.min()!)
    }
    return ans
}
