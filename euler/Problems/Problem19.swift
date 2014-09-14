//
//  Problem19.swift
//  euler
//
//  Created by David Grandinetti on 9/14/14.
//  Copyright (c) 2014 David Grandinetti. All rights reserved.
//

import Foundation

enum Month:Int {
  case January, February, March, April, May, June, July, August, September,
  October, November, December
  
  static let allValues = [January, February, March, April, May, June, July,
    August, September, October, November, December]
  
  //
  // Thirty days has September,
  // April, June and November.
  // All the rest have thirty-one,
  // Saving February alone,
  // Which has twenty-eight, rain or shine.
  // And on leap years, twenty-nine.
  //
  func length(year:Int) -> Int {
    switch self {
    case .April, .June, .September, .November:
      return 30
    case .February:
      return isLeapYear(year) ? 29 : 28
    default:
      return 31
    }
  }
}

enum Weekday:Int {
  case Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
  
  func addDays(days:Int) -> Weekday {
    return Weekday.fromRaw( (self.toRaw()+days)%7 )!
  }
}

func daysInYear(year:Int) -> Int {
  return Month.allValues.map({ $0.length(year) }).reduce(0, combine: +)
}

//
// A leap year occurs on any year evenly divisible by 4, but not on a
// century unless it is divisible by 400.
//
func isLeapYear(year:Int) -> Bool {
  if year%4 == 0 {
    if year%100 == 0 {
      return year%400 == 0
    }
    return true
  }
  return false
}

//
// How many Sundays fell on the first of the month during the twentieth
// century (1 Jan 1901 to 31 Dec 2000)?
//
class Problem19: EulerProblem {
  override func run() {
    // 1 Jan 1900 was a Monday, but we want to start in 1901.
    var firstDayOfYear = (Weekday.Monday).addDays(daysInYear(1900))
    
    var total = 0
    for year in 1901...2000 {
      var currentDay = firstDayOfYear
      for month in Month.allValues {
        if currentDay == .Sunday {
          total++
        }
        currentDay = currentDay.addDays(month.length(year))
      }
      firstDayOfYear = firstDayOfYear.addDays(daysInYear(year))
    }
    
    println("\(total) months started on a Sunday in the 20th century")
  }
}








