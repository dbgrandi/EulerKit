//
// 2520 is the smallest number that can be divided by each of
// the numbers from 1 to 10 without any remainder.
//
// What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
//

final class Problem5: EulerProblem {

  final override func run() {
    print(smallestDivisibleUpTo(20))
  }

  final func smallestDivisibleUpTo(i:Int, current:Int = 1) -> Int {
    if current.isDivisibleUpTo(i) {
      return current
    }
    return smallestDivisibleUpTo(i, current:current+1)
  }
}

