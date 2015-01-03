import Foundation

class Problem28 : EulerProblem {
  override func run() {
    // assume the 1x1 core
    var nums = [1]
    var last = 1
    // 1 + 3...1001
    for i in stride(from: 3, through: 1001, by: 2) {
      // get the first
      last += i-1
      last + i
    }
    //
  }
}