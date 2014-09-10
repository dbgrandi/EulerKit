import Foundation

class Problem16: EulerProblem {
  override func run() {
    println(powerDigitSum(1000))
  }
  
  // given an arbitrarily large integer as a string
  // get the sum of each digit
  func sumOfDigits(num:String) -> Int {
    let length = num.length-1
    var sum = 0
    
    for i in 0...length {
      if let digit = num[i].toInt() {
        sum += digit
      }
    }
    return sum
  }
  
  func doubleIntegerString(s:String) -> String {
    let length = s.length-1
    var result = [Int]()
    var carry = 0
    
    var sArray = Array(s)
    for i in stride(from:length, through:0, by: -1) {
      var sum = carry
      if let digit = String(sArray[i]).toInt() {
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
    for i in result.reverse() {
      resultString += String(i)
    }
    
    return resultString
  }
  
  func powerDigitSum(num:Int) -> Int {
    var n = num
    var stringNum = "2"
    while n > 1 {
      if n%50 == 0 {
        println("n = \(n)")
      }
      stringNum = doubleIntegerString(stringNum)
      n--
    }
    return sumOfDigits(stringNum)
  }
  
}