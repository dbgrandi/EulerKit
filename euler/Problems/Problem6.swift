//
// The sum of the squares of the first ten natural numbers is,
// 12 + 22 + ... + 102 = 385
//
// The square of the sum of the first ten natural numbers is,
// (1 + 2 + ... + 10)2 = 552 = 3025
//
// Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
//
// Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
//

class Problem6: EulerProblem {
  override func run() {
    let diff = squareOfSumUpTo(100) - sumOfSquaresUpTo(100)
    print(diff)
  }
}

func sumOfSquaresUpTo(max:Int) -> Int {
  return (1...max).map({n in n*n}).reduce(0,combine: +)
}

func squareOfSumUpTo(max:Int) -> Int {
  let sum = (1...max).reduce(0,combine: +)
  return sum * sum
}
