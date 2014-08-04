//
// The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
//
// Find the sum of all the primes below two million.
//
// Note: This SegFaults when compiled with `-O3`
// TODO: WhyUSegFault?
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

let seq = MaxLimitSequence(max:2_000_000, sequence:PrimeSequence())
var sum = 0
for i in seq {
  // println(i)
  sum += i
}
// let sum = filter(seq).reduce(0,+)
println("sum = \(sum)")