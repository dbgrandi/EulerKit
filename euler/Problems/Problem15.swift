
class Problem15: EulerProblem {
    override func run() {
        let paths = binaryCoefficient(40,k:20)
        println(paths)
    }

    func binaryCoefficient(n:Int, k:Int) -> Int {
        return reduce(0..<k, 1) { $0 * (n-$1)/($1+1) }
    }
}