//
// 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
//
// What is the sum of the digits of the number 2^1000?
//

class Problem16: EulerProblem {
  override func run() {
    print(powerDigitSum(1000))
  }
  
  func doubleIntegerString(s:String) -> String {
    let length = s.length-1
    var result = [Int]()
    var carry = 0
    
    var sArray = Array(s.characters)
    for i in stride(from:length, through:0, by: -1) {
      var sum = carry
      if let digit = Int(String(sArray[i])) {
        sum += digit + digit
      }
      
      let digitSum = sum%10
      let digitCarry = sum-digitSum
      result.append(digitSum)
      carry = digitCarry
      carry = carry/10
    }
    
    while carry>0 {
      result.append(carry%10)
      carry = carry/10
    }
    
    var resultString:String = ""
    for i in Array(result.reverse()) {
      resultString += String(i)
    }
    
    return resultString
  }
  
  func powerDigitSum(num:Int) -> Int {
    var n = num
    var stringNum = "2"
    while n > 1 {
      stringNum = doubleIntegerString(stringNum)
      n--
    }
    return sumOfDigits(stringNum)
  }
}

class Problem16BigNum : EulerProblem {
  override func run() {
    let two = JKBigInteger(string:"2")
    var accumulator = JKBigInteger(string:"2")
    for _ in 1..<1000 {
      accumulator = accumulator.multiply(two) as! JKBigInteger
    }
    let sum = sumOfDigits(accumulator.stringValue())
    print("sum of digits of 2^1000 = \(sum)")
  }
}