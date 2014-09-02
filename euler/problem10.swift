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

let seq = MaxLimitSequence(max:2_000_000, sequence:PrimeSequence())
let sum = reduce(seq,0,+)
println("sum = \(sum)")