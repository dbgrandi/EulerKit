//
//  Euler.swift
//  euler
//
//  Created by David Grandinetti on 9/2/14.
//  Copyright (c) 2014 David Grandinetti. All rights reserved.
//

import Foundation

private var eulerProblems = Dictionary<Int, EulerProblem>()

class EulerProblem {

    class func registerProblems() {
        registerProblem(1, obj:Problem1())
        registerProblem(2, obj:Problem2())
        registerProblem(3, obj:Problem3())
        registerProblem(4, obj:Problem4())
        registerProblem(5, obj:Problem5())
        registerProblem(6, obj:Problem6())
        registerProblem(7, obj:Problem7())
        registerProblem(8, obj:Problem8())
        registerProblem(9, obj:Problem9())
        registerProblem(10, obj:Problem10())
        registerProblem(11, obj:Problem11())
        registerProblem(12, obj:Problem12())
        registerProblem(13, obj:Problem13())
        registerProblem(14, obj:Problem14())
        registerProblem(16, obj:Problem16())
        registerProblem(17, obj:Problem17())
        registerProblem(18, obj:Problem18())
        registerProblem(19, obj:Problem19())
        registerProblem(20, obj:Problem20BigNum())
        registerProblem(21, obj:Problem21())
        registerProblem(22, obj:Problem22())
        registerProblem(23, obj:Problem23())
        registerProblem(24, obj:Problem24())
        registerProblem(25, obj:Problem25BigNum())
        registerProblem(26, obj:Problem26Iter())
        registerProblem(27, obj:Problem27Iterative())
        registerProblem(28, obj:Problem28())
        registerProblem(29, obj:Problem29())
        registerProblem(30, obj:Problem30())
      }

      class func registerProblem(num:Int, obj:EulerProblem) {
        eulerProblems[num] = obj
      }

    func run() {
        println("OVERRIDE ME")
    }

    class func problems() -> Dictionary<Int, EulerProblem> {
        return eulerProblems
    }
}
