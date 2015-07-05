let args:[String] = Process.arguments
if args.count == 1 {
    print("./euler <probemNumber> to run a single problem")
    print("./euler --all to run all problems")
    exit(0)
}

EulerProblem.registerProblems()
let problems = EulerProblem.problems()

if args[1] == "--all" {
    print("Running all problems")
    for (num, problem) in problems {
        print("Running problem \(num)...")
        Stopwatch.measure("problem") {
            problem.run()
        }
    }
} else {
    let problemString = args[1]
    if let problemNum = Int(problemString) {
        if let problem = problems[problemNum] {
            print("Running problem \(problemNum)...")
            Stopwatch.measure("problem") {
              problem.run()
            }
        } else {
            print("Problem \(problemNum) is not yet implemented")
        }
    } else {
        print("\(problemString) is not a number")
    }
}

