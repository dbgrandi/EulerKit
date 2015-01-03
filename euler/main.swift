//
//  main.swift
//  euler
//
//  Created by David Grandinetti on 8/27/14.
//  Copyright (c) 2014 David Grandinetti. All rights reserved.
//

import Foundation

//EulerProblem.registerProblems()

//var problems = EulerProblem.problems()
//println("problem count = \(problems.count)")
//for i in problems {
//  println("problem name: \(i)")
//}

let prob = Problem27() //  as EulerProblem // problems[2] as EulerProblem
let stopwatch = Stopwatch(name:"problem")
stopwatch.start()
prob.run()
stopwatch.stop()
stopwatch.stats()

// read the input args

