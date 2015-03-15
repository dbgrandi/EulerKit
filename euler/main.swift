
let args:[String] = Process.arguments
if count(args) == 1 {
    println("./euler <probemNumber> to run a single problem")
    println("./euler --all to run all problems")
    exit(0)
}

EulerProblem.registerProblems()
let problems = EulerProblem.problems()

if args[1] == "--all" {
    println("Running all problems")
    for (num, problem) in problems {
        println("Running problem \(num)...")
        Stopwatch.measure("problem") {
            problem.run()
        }
    }
} else {
    let problemString = args[1]
    if let problemNum = problemString.toInt() {
        if let problem = problems[problemNum] {
            println("Running problem \(problemNum)...")
            Stopwatch.measure("problem") {
              problem.run()
            }
        } else {
            println("Problem \(problemNum) is not yet implemented")
        }
    } else {
        println("\(problemString) is not a number")
    }
}

