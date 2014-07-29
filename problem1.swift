extension Int {
  func isMultipleOf(i: Int) -> Bool {
    return (i == 0 ? false : self % i == 0 )
  }
  
  func isMultipleOf(nums:[Int]) -> Bool {
    for i in nums {
      if self.isMultipleOf(i) {
        return true
      }
    }
    return false
  }
}

let sum = filter(1...999, { $0.isMultipleOf([3,5]) }).reduce(0,+)

println("Sum = \(sum)")