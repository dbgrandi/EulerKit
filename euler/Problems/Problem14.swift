//
// The following iterative sequence is defined for the set of positive
// integers:
//
// n → n/2 (n is even)
// n → 3n + 1 (n is odd)
//
// Using the rule above and starting with 13, we generate the following
// sequence:

// 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
// It can be seen that this sequence (starting at 13 and finishing at 1)
// contains 10 terms. Although it has not been proved yet (Collatz Problem),
// it is thought that all starting numbers finish at 1.
//
// Which starting number, under one million, produces the longest chain?
//
// NOTE: Once the chain starts the terms are allowed to go above one million.
//

//
// A Collatz Sequence, which eventually has an end
//
class CollatzSequence: SequenceType {
  let start:Int
  
  init(start:Int) {
    self.start = start
  }
  
  func generate() -> GeneratorOf<Int> {
    var n = 0
    return GeneratorOf<Int> {
      if n == 0 {
        n = self.start
        return n
      }
      if n == 1 {
        return .None
      }
      if n.isEven() {
        n = n/2
      } else {
        n = 3*n+1
      }
      return n
    }
  }
}

class Problem14: EulerProblem {
  override func run() {
    var max = (n:0, length:0)
    
    for i in 1...1_000_000 {
      let currentLength = reduce(CollatzSequence(start:i), 0, {(acc,val) in acc + 1})
      if currentLength > max.length {
        max.n = i
        max.length = currentLength
      }
    }
    
    println("n = \(max.n)")
    println("length = \(max.length)")
  }
}


