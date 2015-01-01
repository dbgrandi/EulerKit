//
// Let d(n) be defined as the sum of proper divisors of n (numbers less than
// n which divide evenly into n).
//
// If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair
// and each of a and b are called amicable numbers.
//
// For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22,
// 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are
// 1, 2, 4, 71 and 142; so d(284) = 220.
//
// Evaluate the sum of all the amicable numbers under 10000.
//
class Problem21: EulerProblem {

  func findSums() -> Dictionary<Int,Int> {
    var sums = Dictionary<Int,Int>()
    for i in 2..<10000 {
      sums[i] = i.properDivisors().reduce(0,+)
    }
    return sums
  }
  
  override func run() {
    let sums = findSums()
    var amicableNumbers = Set<Int>()
    
    for (key, value) in sums {
      if sums[value] == key && key != value {
        println("found pair: \(key), \(value)")
        amicableNumbers.insert(key)
        amicableNumbers.insert(value)
      }
    }
    
    let total = amicableNumbers.reduce(0,+)
    println("total = \(total)")
  }
}
