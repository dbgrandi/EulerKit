import Foundation

//
// Turn each char into a num and sum them up
//
func sumOfDigits(s:String) -> Int {
  return (0..<s.length).map({ Int(s[$0])! }).reduce(0,combine: +)
}

//
// Add two integers that are represented as Strings
//
func addStringInteger(lhs:String, rhs:String) -> String {
  let length = max(lhs.length, rhs.length)
  let left = zeroPadString(lhs, toLength: length)
  let right = zeroPadString(rhs, toLength: length)

  var result = [Int]()
  var carry = 0

  let leftDigits = Array(left.characters)
  let rightDigits = Array(right.characters)

  for i in stride(from:length-1, through:0, by: -1) {
    var sum = carry
    let ldigit = Int(String(leftDigits[i]))!
    let rdigit = Int(String(rightDigits[i]))!
    sum += ldigit + rdigit

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

func zeroPadString(s:String, toLength:Int) -> String {
  let length = toLength - s.length
  if length > 0 {
    return "0".`repeat`(length) + s
  }
  return s
}

func multiplyString(s:String, times:Int) -> String {
  var accumulator = s
  for _ in 2...times {
    accumulator = addStringInteger(accumulator, rhs: s)
  }
  return accumulator
}
