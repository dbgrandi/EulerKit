class Problem1: EulerProblem {
  override func run() {
    let sum = filter(1...999, { $0.isMultipleOf([3,5]) }).reduce(0,+)
    println("Sum = \(sum)")
  }
}
