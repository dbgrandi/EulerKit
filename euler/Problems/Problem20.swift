//
//  Problem20.swift
//  euler
//
//  Created by David Grandinetti on 9/14/14.
//  Copyright (c) 2014 David Grandinetti. All rights reserved.
//

import Foundation

//
//n! means n × (n − 1) × ... × 3 × 2 × 1
//
//For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
//and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
//
//Find the sum of the digits in the number 100!
//
class Problem20: EulerProblem {
  
  func zeroPadString(s:String, toLength:Int) -> String {
    let length = toLength - s.length
    if length > 0 {
      return "0".repeat(length) + s
    }
    return s
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

  func multiplyString(s:String, times:Int) -> String {
    var accumulator = s
    for i in 2...times {
      accumulator = addStringInteger(accumulator, rhs: s)
    }
    return accumulator
  }

  func sumOfDigits(s:String) -> Int {
    return map(0..<s.length, { s[$0].toInt()! }).reduce(0,+)
  }
  
  override func run() {
    var accumulator = "1"
    for i in 2...100 {
      accumulator = multiplyString(accumulator, times: i)
    }
    println("10! = \(accumulator)")
    println("sum = \(sumOfDigits(accumulator))")
  }
}