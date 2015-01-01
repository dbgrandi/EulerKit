//
//n! means n × (n − 1) × ... × 3 × 2 × 1
//
//For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
//and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
//
//Find the sum of the digits in the number 100!
//

func sumOfDigits(s:String) -> Int {
  return map(0..<s.length, { s[$0].toInt()! }).reduce(0,+)
}

class Problem20: EulerProblem {
  override func run() {
    var accumulator = "1"
    for i in 2...100 {
      accumulator = multiplyString(accumulator, i)
    }
    println("10! = \(accumulator)")
    println("sum = \(sumOfDigits(accumulator))")
  }
}

class Problem20BigNum: EulerProblem {
  override func run() {
    var accumulator = JKBigInteger(string:"1")
    for i in 2...100 {
      accumulator = accumulator.multiply(JKBigInteger(unsignedLong:UInt(i))) as JKBigInteger
    }
    println("10! = \(accumulator)")
    println("sum = \(sumOfDigits(accumulator.stringValue()))")
  }
}