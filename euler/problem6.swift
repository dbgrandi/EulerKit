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

func sumOfSquaresUpTo(max:Int) -> Int {
  var sum = 0
  for i in 1...max {
    sum += i*i
  }
  return sum
}

func squareOfSumUpTo(max:Int) -> Int {
  var sum = 0
  for i in 1...max {
    sum += i
  }
  return sum*sum
}

let diff = squareOfSumUpTo(100) - sumOfSquaresUpTo(100)
println(diff)