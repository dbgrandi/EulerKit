//
// In England the currency is made up of pound, £, and
// pence, p, and there are eight coins in general circulation:
//
// 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
//
// It is possible to make £2 in the following way:
//
// 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
//
// How many different ways can £2 be made using any number of coins?
//

import Foundation

final class Problem31 : EulerProblem {
  let allCoins = [200, 100, 50, 20, 10, 5, 2, 1]

  final func findArray(arrays:[[Int]], sub:[Int]) -> Bool {
    for a in arrays {
      if a == sub {
        return true
      }
    }
    return false
  }

  // a solution set is modeled as
  // [Int] where a[x] = the number of coins at position x
  // x is betweeen 0...7 (for 1,2,5,10,20,50,100,200 p respectively)

  final func getCombinationsForTotal(total:Int, withCoins:[Int]) -> [[Int]] {
    var combinations = [[Int]]()
    if total == 0 || withCoins.count == 0 {
      return combinations
    }

    var nextCoins = Array(withCoins)

    for coin in withCoins {
      if coin == total {
        combinations.append([coin])
      } else if coin < total {
        let max = Int(floor(Double(total/coin)))
        for num in stride(from:max, through:1, by:-1) {
          let root = [Int](count: num, repeatedValue: coin)
          for sub in getCombinationsForTotal(total-(coin*num), withCoins:nextCoins) {
            let newComb = (root + sub) // .sorted({$0 > $1})
            if !findArray(combinations, sub:newComb) {
              combinations.append(newComb)
            }
          }
        }
        nextCoins = nextCoins.filter { $0 != coin }
      }
    }

    return combinations
  }

  final override func run() {
    let total = 20
    let allCombinations = getCombinationsForTotal(total, withCoins:allCoins)

    for combo in allCombinations {
      print(combo)
    }

    print("number of combos for \(total): \(allCombinations.count)")
  }
}
