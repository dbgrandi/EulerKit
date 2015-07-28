//
// If we list all the natural numbers below 10 that are multiples of
// 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
//
// Find the sum of all the multiples of 3 or 5 below 1000.
//

class Problem1: EulerProblem {
    override func run() {
        let sum = (1...999).filter({ $0.isMultipleOfAny([3,5]) }).reduce(0,combine: +)
        print("Sum = \(sum)")
    }
}
