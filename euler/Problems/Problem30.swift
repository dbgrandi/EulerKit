//
// Surprisingly there are only three numbers that can be written
// as the sum of fourth powers of their digits:
//
// 1634 = 1^4 + 6^4 + 3^4 + 4^4
// 8208 = 8^4 + 2^4 + 0^4 + 8^4
// 9474 = 9^4 + 4^4 + 7^4 + 4^4
//
// As 1 = 14 is not a sum it is not included.
//
// The sum of these numbers is 1634 + 8208 + 9474 = 19316.
//
// Find the sum of all the numbers that can be written as the sum
// of fifth powers of their digits.
//

class Problem30 : EulerProblem {
  override func run() {
    // what is the upper bound of the domain?
    // let's say 1m and work down from there?

    var numbers = [Int]()

    for i in 2...1_000_000 {
      var digits = i.getDigits()
      let sum = digits.map({$0 * $0 * $0 * $0 * $0}).reduce(0, combine: +)
      if sum == i {
        numbers.append(i)
      }
    }

    let total = numbers.reduce(0,combine:+)
    println("sum of numbers = \(total)")
  }
}