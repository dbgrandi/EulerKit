
class Problem15: EulerProblem {
  class func run() {
    //nothing
  }
  
  func binaryCoefficient(n:Int, k:Int) -> Int {
    var result = 1
    for i in 0..<k {
      result = result * (n-i)/(i+1)
    }
    return result
  }
}