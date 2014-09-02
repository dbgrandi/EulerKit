//
//  Euler.swift
//  euler
//
//  Created by David Grandinetti on 8/27/14.
//  Copyright (c) 2014 David Grandinetti. All rights reserved.
//

import Foundation

class EulerProblem {

  class init {

  }

  class func run() {
    println("subclasses must implement this")
  }

}

//
// extensions to base classes
//

extension Int {
  func isMultipleOf(i: Int) -> Bool {
    return (i == 0 ? false : self % i == 0 )
  }
  
  func isMultipleOf(nums:[Int]) -> Bool {
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

  func even() -> Bool {
    return self % 2 == 0
  }
  func odd() -> Bool {
    return !self.even()
  }

  func primeFactors() -> [Int] {
    var current = self
    var factors = Dictionary<Int,Int>()
    var try = 2
    
    while try <= current {
        if isPrime(try) && (current % try == 0) {
            current = current / try
            if let f = factors[try] {
                factors[try] = f+1
            } else {
                factors[try] = 1
            }
        } else {
            try++
        }
    }
    
    return Array(factors.values)
  }

}

extension String {
    var length: Int { return countElements(self) }

    subscript(i: Int) -> String {
        return String(Array(self)[i])
    }
}

//
// sequence tools
//

//
// An infinite sequence of Fibonacci numbers
//
class FibonacciSequence: SequenceType {
  func generate() -> GeneratorOf<Int> {
    var last = 0
    var current = 1
    
    return GeneratorOf<Int> {
      let next = last + current
      last = current
      current = next
      return next
    }
  }
}

//
// An infinite sequence of Prime numbers
//
class PrimeSequence: SequenceType {
    func generate() -> GeneratorOf<Int> {
        var currentPrime = 1
        var nextPrime = 1
        
        return GeneratorOf<Int> {
          nextPrime = currentPrime+1
            while !isPrime(nextPrime) {
              nextPrime += 1
            }
            currentPrime = nextPrime
            return nextPrime
        }
    }
}

//
// A wrapper to stop a Sequence when it grows to
// a maximum value.
//
class MaxLimitSequence<S: SequenceType, T where T == S.Generator.Element, T:Comparable>: SequenceType {
  let max:T
  var sequence:S

  init(max:T, sequence:S) {
    self.max = max
    self.sequence = sequence
  }
  
  func generate() -> GeneratorOf<T> {
    var generator = self.sequence.generate()

    return GeneratorOf<T> {
      var next = generator.next()
      if next != .None && next < self.max {
        return next
      }
      return .None
    }
  }
}

