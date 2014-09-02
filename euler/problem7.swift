//
// By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
//
// What is the 10 001st prime number?
//

import Cocoa

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

//
// An infinite sequence of Prime numbers
//
class PrimeSequence: SequenceType {
    func generate() -> GeneratorOf<Int> {
        var currentPrime = 2
        var nextPrime = 2
        
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
// A wrapper to stop a Sequence after it emits a certain
// number of elements.
//
class MaxCountSequence<S: SequenceType, T where T == S.Generator.Element>: SequenceType {
    let max:Int
    var counter:Int
    var sequence:S

    init(max:Int, sequence:S) {
        self.max = max
        self.sequence = sequence
        self.counter = 0
    }
    
    func generate() -> GeneratorOf<T> {
        var generator = self.sequence.generate()

        return GeneratorOf<T> {
            var next = generator.next()
            self.counter += 1
            if next != nil && (self.counter < self.max) {
                return next
            }
            return .None
        }
    }
}

var primes = MaxCountSequence(max:10_001, sequence:PrimeSequence())
var lastPrime = 0
for i in primes {
  lastPrime = i
}
println(lastPrime)
