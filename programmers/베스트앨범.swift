import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
  // 장르:(번호,재생횟수)로 저장할 딕셔너리
    var singNum: [String:[(Int, Int)]] = [:]
  // 장루:재생횟수의 합으로 저장할 딕셔너리
    var singPlays: [String: Int] = [:]
    for i in 0..<genres.count {
        if singNum[genres[i]] == nil {
            singNum[genres[i]] = [(i, plays[i])]
        } else {
            singNum[genres[i]]!.append((i, plays[i]))
        }
        if singPlays[genres[i]] == nil {
            singPlays[genres[i]] = plays[i]
        } else {
            singPlays[genres[i]]! += plays[i]
        }
    }
    
    var ans: [Int] = []
  // 재생횟수의 합에 대해 내림차순으로 정렬
    let sortedSing = singPlays.sorted { $0.1 > $1.1 }
    
    for i in sortedSing {
      // 재생횟수가 많은 순서대로 정렬
        let tmp = singNum[i.key]!.sorted { n1, n2 in
            if n1.1 > n2.1 {
                return n1 > n2
            } else {
                return n1 < n2
            }
        }
      // 곡이 2곡 이상일때는 2개 저장
        ans.append(tmp[0].0)
        if tmp.count > 1 {
            ans.append(tmp[1].0)
        }
    }
    return ans
}
