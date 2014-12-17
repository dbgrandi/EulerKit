//
// The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
//
// Find the sum of all the primes below two million.
//

class Problem10: EulerProblem {
  override func run() {
    let seq = LimitSequence(sequence: PrimeSequence()) { $1 < 2_000_000 }
    let sum = reduce(seq,0,+)
    println("sum = \(sum)")  }
}
