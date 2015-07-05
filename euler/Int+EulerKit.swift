import Foundation

private var primeCache = Dictionary<Int, Int>()

extension Int {
  func isMultipleOf(i: Int) -> Bool {
    return (i == 0 ? false : self % i == 0 )
  }

  func isMultipleOfAny(nums:[Int]) -> Bool {
    for i in nums {
      if self.isMultipleOf(i) {
        return true
      }
    }
    return false
  }

  func isDivisibleUpTo(max:Int) -> Bool {
    for i in stride(from: max, through: 2, by: -1) {
      if self % i != 0 {
        return false
      }
    }
    return true
  }

  func isEven() -> Bool {
    return self % 2 == 0
  }

  func isOdd() -> Bool {
    return !self.isEven()
  }

  func numberOfDivisors() -> Int {
    var divisors = 1
    for i in self.primeFactors() {
      divisors = divisors * (i+1)
    }
    return divisors
  }

  func properDivisors() -> [Int] {
    return (1...self/2).filter({ self % $0 == 0 })
  }

  func isPrime() -> Bool {
    if self < 2 {
      return false
    }

    if self == 2 || self == 3 {
      return true
    }

    if self % 2 == 0 {
      return false
    }

    if let _ = primeCache[self] {
      return true
    }

    if self == 5 || self == 7 {
      return true
    }

    let squareRoot:Int = Int(sqrt(Float(self)))
    let upperBound = squareRoot
    for i in 3...upperBound {
      if self % i == 0 {
        return false
      }
    }
    primeCache[self] = 1
    return true
  }

  func primeFactors() -> [Int] {
    if self.isPrime() {
      return [self]
    }
    var current = self
    var factors = Dictionary<Int,Int>()
    var attempt = 2

    while attempt <= current {
      if attempt.isPrime() && (current % attempt == 0) {
        current = current / attempt
        if let f = factors[attempt] {
          factors[attempt] = f+1
        } else {
          factors[attempt] = 1
        }
      } else {
        attempt++
      }
    }

    return Array(factors.values)
  }

  func factorial() -> Int {
    if self == 1 {
      return 1
    }
    return self * (self-1).factorial()
  }

  func isPalindrome() -> Bool {
    let digits = Array(String(self).characters)
    var first = 0
    var last = digits.count-1
    while first < last {
      if digits[first] != digits[last] {
        return false
      }
      first++
      last--
    }
    return true
  }

  func getDigits() -> [Int] {
    // if the number is less than 10, just return it in an array
    if self < 10 {
      return [ self ]
    }

    var digits = [Int]()
    var tmpSelf = Int(self)

    while tmpSelf > 9 {
      digits.append(tmpSelf % 10)
      tmpSelf = tmpSelf / 10
    }
    digits.append(tmpSelf % 10)

    return Array(digits.reverse())
  }

}