//
//n! means n × (n − 1) × ... × 3 × 2 × 1
//
//For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
//and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
//
//Find the sum of the digits in the number 100!
//

final class Problem20: EulerProblem {
  final override func run() {
    var accumulator = "1"
    for i in 2...100 {
      accumulator = multiplyString(accumulator, times: i)
    }
    print("10! = \(accumulator)")
    print("sum = \(sumOfDigits(accumulator))")
  }
}

final class Problem20BigNum: EulerProblem {
  final override func run() {
    var accumulator = JKBigInteger(string:"1")
    for i in 2...100 {
      accumulator = accumulator.multiply(JKBigInteger(unsignedLong:UInt(i))) as! JKBigInteger
    }
    print("10! = \(accumulator)")
    print("sum = \(sumOfDigits(accumulator.stringValue()))")
  }
}