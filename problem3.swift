//
// The prime factors of 13195 are 5, 7, 13 and 29.
//
// What is the largest prime factor of the number 600851475143 ?
//

import Cocoa

let num = 600851475143
//let num = 13195

var primeCache = Dictionary<Int, Int>()
func isPrime(num:Int) -> Bool {
  if num < 2 {
    return false
  }
  if num == 2 || num == 3 {
    return true
  }
  if num % 2 == 0 {
    return false
  }
  if let cachedVal = primeCache[num] {
    return true
  }
  
  let squareRoot:Int = Int(sqrt(Float(num)))
  let upperBound = squareRoot
  for i in 3...upperBound {
    if num % i == 0 {
      return false
    }
  }
  primeCache[num] = 1
  return true
}

func maxPrimeFactor(n:Int) -> Int? {
  var current = n
  var factors:[Int] = []
  var try = 2
  
  while try <= current {
    if isPrime(try) && (current % try == 0) {
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

if let max = maxPrimeFactor(num) {
  println("Max prime factor of \(num) is \(max)")
} else {
  println("\(num) is a prime number.")
}
