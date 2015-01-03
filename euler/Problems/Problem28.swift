class Problem28Iterative : EulerProblem {
  override func run() {
    // assume the 1x1 core
    var nums = [1]
    var last = 1
    for i in stride(from: 3, through: 1001, by: 2) {
      for j in 0...3 {
        last += i-1
        nums.append(last)
      }
    }
    let sum = nums.reduce(0,+)
    println("sum = \(sum)")
  }
}

class Problem28 : EulerProblem {
  override func run() {
    // given a size, find the sum of the next 4 diagonal numbers around it
    let findCorners: Int -> [Int] = { i in
      let corner = i*i
      let stride = i+1
      return (corner+stride), corner+(2*stride), corner+(3*stride), corner+4*stride]
    }

    // because we are mapping on the diagonals of the next
    // larger square, we only go through 999
    let s = stride(from:1, through:999, by:2)

    // assume the 1x1 core
    let diagonals = map(s,findCorners).reduce([1],+)
    let sum = diagonals.reduce(0,+)
    println("sum = \(sum)")
  }
}