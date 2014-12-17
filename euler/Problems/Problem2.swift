class Problem2: EulerProblem {
  override func run() {
    //
    // By considering the terms in the Fibonacci sequence whose values do not
    // exceed four million, find the sum of the even-valued terms.
    //

    let seq = LimitSequence(sequence: FibonacciSequence()) { $1 < 4_000_000 }
    let sum = filter(seq, { $0 % 2 == 0 }).reduce(0,+)
    println("sum = \(sum)")
  }
}
