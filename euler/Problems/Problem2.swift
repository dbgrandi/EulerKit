//
// By considering the terms in the Fibonacci sequence whose values do not
// exceed four million, find the sum of the even-valued terms.
//

class Problem2: EulerProblem {
  override func run() {
    let sum = FibonacciSequence().takeWhile({ $0 < 4_000_000 }).filter(isEven).reduce(0,combine: +)
    print("sum = \(sum)")
  }
}
