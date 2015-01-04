//
// A unit fraction contains 1 in the numerator. The decimal representation of the unit
// fractions with denominators 2 to 10 are given:
//
// 1/2	= 	0.5
// 1/3	= 	0.(3)
// 1/4	= 	0.25
// 1/5	= 	0.2
// 1/6	= 	0.1(6)
// 1/7	= 	0.(142857)
// 1/8	= 	0.125
// 1/9	= 	0.(1)
// 1/10	= 	0.1
//
// Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen
// that 1/7 has a 6-digit recurring cycle.
//
// Find the value of d < 1000 for which 1/d contains the longest recurring cycle in
// its decimal fraction part.
//

class Problem26Iter : EulerProblem {
  //
  // This one needs some explanation.
  //
  // Assumptions:
  // - 1/n will have at most a n-1 length cycle
  // - If we reverse the search and find a long cycle, we can skip
  //   a lot of smaller iterations
  // - we don't care about the answer of the division, only the length
  // - we can test for repeating if we get a remainder that we have seen before
  //
  //
  override func run() {
    var maxLength = 0;
    var maxDenominator = 0;

    for i in stride(from:999, through:7, by:-2) {
      if maxLength >= i { break }

      var remainders = [Int](count:i, repeatedValue:0)
      var value = 1
      var position = 0

      while (remainders[value] == 0 && value != 0) {
        remainders[value] = position++
        value = (value*10) % i
      }

      if (position - remainders[value] > maxLength) {
        maxLength = position - remainders[value]
        maxDenominator = i
      }
    }

    println("maxLength = \(maxLength)")
    println("maxDenominator = \(maxDenominator)")
  }

}
