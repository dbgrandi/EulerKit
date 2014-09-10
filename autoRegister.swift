//
//  main.swift
//  euler
//
//  Created by David Grandinetti on 8/27/14.
//  Copyright (c) 2014 David Grandinetti. All rights reserved.
//

import Foundation

@objc class EulerProblemDict {
  @objc class var sharedInstance : Dictionary<Int,String> {
  struct Static {
    static var onceToken : dispatch_once_t = 0
    static var instance : Dictionary<Int,String>? = nil
    }
    dispatch_once(&Static.onceToken) {
      println("EulerProblemDict: init static dictionary")
      Static.instance = Dictionary<Int,String>()
    }
    return Static.instance!
  }
  
  class func load() {
    println("EulerProblemDict: +load()")
    EulerProblemDict.sharedInstance
  }
}

@objc class EulerProblem {

  class func load() {
    let clazz = NSStringFromClass(self).componentsSeparatedByString(".").last!
    println("EulerProblem: +load() for class = \(clazz)")
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

class Problem1: EulerProblem {
  
  override class func load() {
    let clazz = NSStringFromClass(self).componentsSeparatedByString(".").last!
    println("EulerProblem: +load() for class = \(clazz)")
    if let problemNumber:String = clazz.componentsSeparatedByString("Problem").last {
      if let num = problemNumber.toInt() {
        var dict = EulerProblemDict.sharedInstance
        dict[num] = clazz
        println("problem[\(num)] = \(clazz)")
      }
    }
  }
  
  override class func run() {
    println("Problem1: RUNNING")
  }
}

class Problem2: EulerProblem {
  override class func load() {
    super.load()
  }

  override class func run() {
    println("Problem2: RUNNING")
  }
}

println("Main: running")
var dict = EulerProblemDict.sharedInstance
Problem2.run()
println("Main: \(dict.count)")

