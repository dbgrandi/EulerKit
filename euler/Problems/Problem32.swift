//
// We shall say that an n-digit number is pandigital if it makes use of all
// the digits 1 to n exactly once; for example, the 5-digit number, 15234,
// is 1 through 5 pandigital.
//
// The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing
// multiplicand, multiplier, and product is 1 through 9 pandigital.
//
// Find the sum of all products whose multiplicand/multiplier/product identity
// can be written as a 1 through 9 pandigital.
//
// HINT: Some products can be obtained in more than one way so be sure to only
// include it once in your sum.
//

import Foundation

final class Problem32 : EulerProblem {

    final override func run() {
        print("answer to 32")

        let digits = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        let dividers = ["*", "="]

        // generate all permutations of digits
        // for each permutation, insert the dividers in each spot




        let products:Set<Int> = Set<Int>()

        let sum = products.reduce(0,combine: +)
        print("Sum of all pandigital products: \(sum)")
    }
}
