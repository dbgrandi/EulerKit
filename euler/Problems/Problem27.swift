//
// Euler discovered the remarkable quadratic formula:
//
// n² + n + 41
//
// It turns out that the formula will produce 40 primes for the
// consecutive values n = 0 to 39.
//
// However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is
// divisible by 41, and certainly when n = 41, 41² + 41 + 41
// is clearly divisible by 41.
//
//
// The incredible formula  n² − 79n + 1601 was discovered, which
// produces 80 primes for the consecutive values n = 0 to 79.
// The product of the coefficients, −79 and 1601, is −126479.
//
// Considering quadratics of the form:
//
//  n² + an + b, where |a| < 1000 and |b| < 1000
//
//  where |n| is the modulus/absolute value of n
//  e.g. |11| = 11 and |−4| = 4
//
// Find the product of the coefficients, a and b, for the quadratic
// expression that produces the maximum number of primes for
// consecutive values of n, starting with n = 0.
//

class Problem27Iterative : EulerProblem {

  func quadratic(n:Int, a:Int, b:Int) -> Int {
    return n*n + a*n + b
  }

  func primesLength(a:Int, b:Int) -> Int {
    var n = 0
    while(quadratic(n, a:a, b:b).isPrime()) {
      n += 1
    }
    return n
  }

  override func run() {
    var coefficients: (a:Int, b:Int) = (0,0)
    var maxLength = 0
    for a in -1000...1000 {
      for b in -1000...1000 {
        let length = primesLength(a, b:b)
        if length > maxLength {
          maxLength = length
          coefficients = (a,b)
        }
      }
    }
    let prod = coefficients.a * coefficients.b
    println("prod = \(prod)")
  }
}

class Problem27 : EulerProblem {

  func quadratic(n:Int, a:Int, b:Int) -> Int {
    return n*n + a*n + b
  }

  func primesLength(a:Int, b:Int) -> Int {
    let nums = IntegerSequence(n: 0)
    let limit = LimitSequence(sequence: nums) { !self.quadratic($1, a:a, b:b).isPrime() }
    return Array(limit).last!
  }

  override func run() {
    var coefficients: (a:Int, b:Int) = (0,0)
    var maxLength = 0
    for a in -1000...1000 {
      for b in -1000...1000 {
        let length = primesLength(a, b:b)
        if length > maxLength {
          maxLength = length
          coefficients = (a,b)
        }
      }
    }
    let prod = coefficients.a * coefficients.b
    println("prod = \(prod)")
  }
}