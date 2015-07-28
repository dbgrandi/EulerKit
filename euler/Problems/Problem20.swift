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
    let total = (2...100).reduce("1") { multiplyString($0, times: $1) }
    print("100! = \(total)")
    print("sum = \(sumOfDigits(total))")
  }
}

final class Problem20JKBigNum: EulerProblem {
  final override func run() {
    var accumulator = JKBigInteger(string:"1")
    for i in 2...100 {
      accumulator = accumulator.multiply(JKBigInteger(unsignedLong:UInt(i))) as! JKBigInteger
    }
    print("10! = \(accumulator)")
    print("sum = \(sumOfDigits(accumulator.stringValue()))")
  }
}