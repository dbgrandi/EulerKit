//
//  main.swift
//  euler
//
//  Created by David Grandinetti on 8/27/14.
//  Copyright (c) 2014 David Grandinetti. All rights reserved.
//

import Foundation

protocol EulerProblem {
  class func run()
  class func allProblems() -> Dictionary<Int,String>
}

private class EulerProblemDict {
  class var sharedInstance : Dictionary<Int,String> {
  struct Static {
    static var onceToken : dispatch_once_t = 0
    static var instance : Dictionary<Int,String>? = nil
    }
    dispatch_once(&Static.onceToken) {
      println("init")
      Static.instance = Dictionary<Int,String>()
    }
    return Static.instance!
  }
}

@objc class EulerProblemImpl: EulerProblem {

//  class var problems: Dictionary<Int,String> {
//    struct EulerProblems {
//      static var problems = Dictionary<Int,String>()
//    }
//    println(EulerProblems.problems.count)
//    return EulerProblems.problems
//  }

  class func initialize() {
    let clazz = NSStringFromClass(self).componentsSeparatedByString(".").last!
    if let problemNumber:String = clazz.componentsSeparatedByString("Problem").last {
      if let num = problemNumber.toInt() {
        var dict = EulerProblemDict.sharedInstance
        dict[num] = clazz
        println("problem[\(num)] = \(clazz)")
      }
    }
  }

  class func run() {
    println("OVERRIDE ME")
  }
  
  class func allProblems() -> Dictionary<Int,String> {
    return EulerProblemDict.sharedInstance
  }
}

class Problem1: EulerProblemImpl {
  override class func run() {
    println("problem 1 is RUNNING")
  }
}

class Problem2: EulerProblemImpl {
  override class func run() {
    println("problem 2 is RUNNING")
  }
}

println("loaded")
EulerProblemDict.sharedInstance.count
var dict = EulerProblemDict.sharedInstance
dict[3] = "asdf"
dict[4] = "asdf2"
println(dict.count)