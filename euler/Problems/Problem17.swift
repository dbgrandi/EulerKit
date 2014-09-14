//
//  Problem17.swift
//  euler
//
//  Created by David Grandinetti on 9/10/14.
//  Copyright (c) 2014 David Grandinetti. All rights reserved.
//

import Foundation

//
// If the numbers 1 to 5 are written out in words: one, two, three, four,
// five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
//
// If all the numbers from 1 to 1000 (one thousand) inclusive were written
// out in words, how many letters would be used?
//
// NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and
// forty-two) contains 23 letters and 115 (one hundred and fifteen) contains
// 20 letters. The use of "and" when writing out numbers is in compliance
// with British usage.
//

extension Int {
  
  // A very limited int to humanized impl that works for
  // integers <= 1000
  func toWords() -> String {
    let digits = ["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    let tens = ["", "","twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
    let teens = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
    
    switch self {
    case 1000:
      return "one thousand"
    case 100...999:
      let mod100 = (self%100).toWords()
      if mod100 != "" {
        return "\(digits[self/100]) hundred and \(mod100)"
      } else {
        return "\(digits[self/100]) hundred"
      }
    case 20...99:
      let mod10 = (self%10).toWords()
      if mod10 != "" {
        return "\(tens[self/10])-\(mod10)"
      } else {
        return tens[self/10]
      }
    case 10...19:
      return teens[self%10]
    case 1...9:
      return digits[self]
    default:
      return ""
    }
    
    
    //    var result = ""
    //    if self >= 100 {
    //      result += digits[self/100]
    //      result += " hundred and "
    //    }
    //
    //    var n = self%100
    //    if n >= 20 {
    //      result += tens[n/10]
    //      n = n%10
    //      if n != 0 {
    //        result += "-"
    //      }
    //    }
    //
    //    if n >= 10 {
    //      result += teens[n%10]
    //    } else {
    //      result += digits[n]
    //    }
    //    
    //    return result
  }
}

class Problem17: EulerProblem {
  override func run() {
    var length = 0
    for i in 1...1000 {
      length += lengthAfterCleaning(i.toWords())
    }
    println("sum of length = \(length)")
  }
  
  func lengthAfterCleaning(s:String) -> Int {
    return countElements(Array(s).filter({$0 != " " && $0 != "-"}))
  }
}