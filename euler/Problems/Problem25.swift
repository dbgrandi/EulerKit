//
//  Problem25.swift
//  euler
//
//  Created by David Grandinetti on 9/19/14.
//  Copyright (c) 2014 David Grandinetti. All rights reserved.
//

import Foundation
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

class StringFibonacciSequence: SequenceType {
  func generate() -> GeneratorOf<String> {
    var last = "0"
    var current = "1"
    
    return GeneratorOf<String> {
      let next = addStringInteger(last, current)
      last = current
      current = next
      return next
    }
  }
}

class Problem25: EulerProblem {
  override func run() {
    var fibGenerator = StringFibonacciSequence().generate()
    var current = fibGenerator.next()!
    var next = fibGenerator.next()!
    var n = 3
    
    while next != .None && next.length < 1000 {
      current = next
      next = fibGenerator.next()!
      n++
    }
    println("fib(\(n)) is longer than 1000 characters")
  }
}
