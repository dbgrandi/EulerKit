//
// The prime factors of 13195 are 5, 7, 13 and 29.
//
// What is the largest prime factor of the number 600851475143 ?
//

class Problem3: EulerProblem {
    let problem3num = 600851475143

    override func run() {

        let factors = problem3num.primeFactors()

        print("Max prime factor of \(problem3num) is \(factors.last!)")
    }
}
