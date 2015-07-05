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
  let allCoins = [1, 2, 5, 10, 20, 50, 100, 200]

    func count(coins:[Int], total:Int) -> Int {
        // table[i] will be storing the number of solutions for
        // value i. We need n+1 rows as the table is consturcted
        // in bottom up manner using the base case (n = 0)

        // Initialize all table values as 0
        var solutions = Array<Int>(count: coins.count+1, repeatedValue: 0)

        solutions[0] = 1

        for i in coins {
            for j in i...total {
                solutions[j] += solutions[j-i]
            }
        }

        return solutions[total]
    }

  final override func run() {
    let total = 200
    let allCombinations = count(allCoins, total:total)

    print("number of combos for \(total): \(allCombinations)")
  }
}
