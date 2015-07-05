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
final class CollatzSequence: SequenceType {
  let start:Int
  
  init(start:Int) {
    self.start = start
  }
  
  final func generate() -> AnyGenerator<Int> {
    var n = 0
    return anyGenerator {
        switch(n) {
        case 0: n = self.start
        case 1: return .None
        case _ where n.isEven(): n = n/2
        default: n = 3*n+1
        }
        return n
    }
  }
}

final class Problem14: EulerProblem {
  final override func run() {
    var max = (n:0, length:0)
    
    for i in 1...1_000_000 {
      let currentLength = CollatzSequence(start:i).reduce(0, combine: {(acc,val) in acc + 1})
      if currentLength > max.length {
        max.n = i
        max.length = currentLength
      }
    }
    
    print("n = \(max.n)")
    print("length = \(max.length)")
  }
}


