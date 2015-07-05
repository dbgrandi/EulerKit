//
// By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
//
// What is the 10,001st prime number?
//

class Problem7: EulerProblem {
  override func run() {
    // swift doesn't like it if I use $0 here, so explicitly using "(i,x) -> Bool"
    let primes = LimitSequence(sequence:PrimeSequence()) { (i, x) -> Bool in i < 10_001 }
    if let lastPrime = Array(primes).last {
      print(lastPrime)
    }
  }
}
