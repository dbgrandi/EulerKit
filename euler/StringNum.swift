//
//  StringNum.swift
//  euler
//
//  Created by David Grandinetti on 12/31/14.
//  Copyright (c) 2014 David Grandinetti. All rights reserved.
//

import Foundation

//
// Add two integers that are represented as Strings
//
func addStringInteger(lhs:String, rhs:String) -> String {
  let length = max(lhs.length, rhs.length)
  let left = zeroPadString(lhs, length)
  let right = zeroPadString(rhs, length)

  var result = [Int]()
  var carry = 0

  let leftDigits = Array(left)
  let rightDigits = Array(right)

  for i in stride(from:length-1, through:0, by: -1) {
    var sum = carry
    let ldigit = String(leftDigits[i]).toInt()!
    let rdigit = String(rightDigits[i]).toInt()!
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
  for i in result.reverse() {
    resultString += String(i)
  }

  return resultString
}

func zeroPadString(s:String, toLength:Int) -> String {
  let length = toLength - s.length
  if length > 0 {
    return "0".repeat(length) + s
  }
  return s
}

func multiplyString(s:String, times:Int) -> String {
  var accumulator = s
  for i in 2...times {
    accumulator = addStringInteger(accumulator, s)
  }
  return accumulator
}
