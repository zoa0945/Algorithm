import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var menu: [String: Int] = [:]
    var res: [String] = []
    var str = ""
    
  // 코스요리를 만드는 함수
    func makeOrder(_ order: [String], _ cnt: Int, _ idx: Int) {
        if str.count == cnt {
            let newStr = String(str.sorted(by: <))
            if menu[newStr] == nil {
                menu[newStr] = 1
            } else {
                menu[newStr]! += 1
            }
        } else {
            for i in idx..<order.count {
                let tmp = str
                str += String(order[i])
                makeOrder(order, cnt, i + 1)
                str = tmp
            }
        }
    }
    
    for i in course {
        for j in orders {
            makeOrder(j.map{ String($0) }, i, 0)
        }
      // 코스요리를 구성하는 메뉴 개수마다 가장 많이 주문된 코스를 저장
        let max = menu.values.max()
        for i in menu {
            if i.value == max && i.value > 1 {
                res.append(i.key)
            }
        }
        menu = [:]
    }
    
    return res.sorted(by: <)
}
