class Problem2: EulerProblem {
  override func run() {
    //
    // By considering the terms in the Fibonacci sequence whose values do not
    // exceed four million, find the sum of the even-valued terms.
    //

    let seq = LimitSequence(sequence: FibonacciSequence()) { $1 < 4_000_000 }
    let sum = seq.filter({ $0.isEven() }).reduce(0,combine: +)

    print("sum = \(sum)")
  }
}
