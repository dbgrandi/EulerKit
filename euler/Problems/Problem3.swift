//
// The prime factors of 13195 are 5, 7, 13 and 29.
//
// What is the largest prime factor of the number 600851475143 ?
//

import Cocoa

let problem3num = 600851475143
//let problem3num = 13195

class Problem3: EulerProblem {
  
  override func run() {
    if let max = maxPrimeFactor(problem3num) {
      println("Max prime factor of \(problem3num) is \(max)")
    } else {
      println("\(problem3num) is a prime number.")
    }
  }
  
  func maxPrimeFactor(n:Int) -> Int? {
    var current = n
    var factors:[Int] = []
    var try:Int = 2
    
    while try <= current {
      if try.isPrime() && (current % try == 0) {
        current = current / try
        factors.append(try)
      }
      try++
    }
    
    if factors.count == 0 {
      return .None
    }
    
    println(factors)
    return factors[factors.count-1]
  }
}
