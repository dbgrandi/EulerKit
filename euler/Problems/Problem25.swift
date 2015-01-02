class StringFibonacciSequence: SequenceType {
  func generate() -> GeneratorOf<String> {
    var last = "0"
    var current = "1"
    
    return GeneratorOf<String> {
      let next = addStringInteger(last, current)
      last = current
      current = next
      return next
    }
  }
}

class Problem25: EulerProblem {
  override func run() {
    let seq = LimitSequence(sequence: StringFibonacciSequence()) { $1.length < 1000 }
    let items = Array(seq)
    let n = items.count
    // our fib sequence spits out the 3rd value the first time it is pumped, so we add 2
    println("fib(\(n+2)) is longer than 1000 digits")
  }
}

//
// Use JKBigInteger
//

class BigNumFibonacciSequence: SequenceType {
  func generate() -> GeneratorOf<JKBigInteger> {
    var last = JKBigInteger(string:"0")
    var current = JKBigInteger(string:"1")

    return GeneratorOf<JKBigInteger> {
      let next = last.add(current) as JKBigInteger
      last = current
      current = next
      return next
    }
  }
}

class Problem25BigNumWithMappingWrapper: EulerProblem {
  override func run() {
    let bigNumFibSeq = BigNumFibonacciSequence()
    let mapSequence = MappingSequence(sequence: bigNumFibSeq, map: { $0.stringValue().length } )
    let limitSeq = LimitSequence(sequence: mapSequence) { (i:Int, j:Int) in return j < 1000 }
    let items = Array(limitSeq)
    // our fib sequence spits out the 3rd value the first time it is pumped, so we add 2
    println("fib(\(items.count+2)) is longer than 1000 digits")
  }
}

class Problem25BigNumWithByteCount: EulerProblem {
  let thousandDigitByteSize = thousandDigitBigNum().countBytes()

  func check(num:JKBigInteger) -> Bool {
    if num.countBytes() < thousandDigitByteSize {
      return true
    }
    return countElements(num.stringValue().utf16) < 1000
  }

  override func run() {
    let bigNumFibSeq = BigNumFibonacciSequence()
    let limitSeq = LimitSequence(sequence: bigNumFibSeq) { self.check($1) }
    let items = Array(limitSeq)
    // our fib sequence spits out the 3rd value the first time it is pumped, so we add 2
    println("fib(\(items.count+2)) is longer than 1000 digits")
  }
}

class Problem25Iterative: EulerProblem {
  func check(n:JKBigInteger) -> Bool {
    let s:NSString = n.stringValue()
    return s.length < 1000
  }

  override func run() {
    var n1 = JKBigInteger(string:"1")
    var n2 = JKBigInteger(string:"2")
    var next_number:JKBigInteger
    var i:Int = 2

    do {
      next_number = n1.add(n2) as JKBigInteger
      i += 1
      n1 = n2
      n2 = next_number
    } while countElements(next_number.stringValue().unicodeScalars) < 1000

    println("fib(\(i)) is longer than 1000 digits")
  }
}
