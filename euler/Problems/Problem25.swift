class StringFibonacciSequence: SequenceType {
  func generate() -> AnyGenerator<String> {
    var last = "0"
    var current = "1"
    
    return anyGenerator {
      let next = addStringInteger(last, rhs: current)
      last = current
      current = next
      return next
    }
  }
}

class Problem25: EulerProblem {
  override func run() {
    let seq = LimitSequence(sequence: StringFibonacciSequence()) { $1.length < 1000 }
    let items = Array(arrayLiteral: seq)
    let n = items.count
    // our fib sequence spits out the 3rd value the first time it is pumped, so we add 2
    print("fib(\(n+2)) is longer than 1000 digits")
  }
}

//
// Use JKBigInteger
//

class BigNumFibonacciSequence: SequenceType {
  func generate() -> AnyGenerator<JKBigInteger> {
    var last = JKBigInteger(string:"0")
    var current = JKBigInteger(string:"1")

    return anyGenerator {
      let next = last + current
      last = current
      current = next
      return next
    }
  }
}

class Problem25BigNum: EulerProblem {
  // problem finished in 3.19666504859924 seconds
  override func run() {
    let fibSeq = BigNumFibonacciSequence()

    //
    // if instead we just count the elements of stringValue()
    // problem finished in 4.03327995538712 seconds
    //

    let limitSeq = LimitSequence(sequence: fibSeq) { $1.stringValue().utf16.count < 1000 }
    let items = Array(arrayLiteral: limitSeq)
    // our fib sequence spits out the 3rd value the first time it is pumped, so we add 2
    print("fib(\(items.count+2)) is longer than 1000 digits")
  }
}

func thousandDigitBigNum() -> JKBigInteger {
  //
  // a = "1"
  // 999.times { a += "0" }
  //

  let bigString = "1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"

  return JKBigInteger(string:bigString)
}

class Problem25BigNumWithByteCount: EulerProblem {
  let thousandDigitByteSize = thousandDigitBigNum().countBytes()

  func check(num:JKBigInteger) -> Bool {
    if num.countBytes() < thousandDigitByteSize {
      return true
    }
    return num.stringValue().utf16.count < 1000
  }

  // problem finished in 0.0535169839859009 seconds
  override func run() {
    let bigNumFibSeq = BigNumFibonacciSequence()
    let limitSeq = LimitSequence(sequence: bigNumFibSeq) { self.check($1) }
    let items = Array(arrayLiteral: limitSeq)
    // our fib sequence spits out the 3rd value the first time it is pumped, so we add 2
    print("fib(\(items.count+2)) is longer than 1000 digits")
  }
}
class Problem25BigNumWithByteCountAndGenerator: EulerProblem {
  let thousandDigitByteSize = thousandDigitBigNum().countBytes()

  func check(num:JKBigInteger) -> Bool {
    if num.countBytes() < thousandDigitByteSize {
      return true
    }
    return num.stringValue().utf16.count < 1000
  }

  // problem finished in 0.0250449776649475 seconds
  override func run() {
    let fibGen = BigNumFibonacciSequence().generate()
    var counter = 2
    var next = fibGen.next()
    while check(next!) {
      counter += 1
      next = fibGen.next()
    }

    // our fib sequence spits out the 3rd value the first time it is pumped, so we add 2
    print("fib(\(counter)) is longer than 1000 digits")
  }
}

class Problem25BigNumIterative: EulerProblem {
  // problem finished in 3.2816349864006 seconds
  override func run() {
    var n1 = JKBigInteger(string:"0")
    var n2 = JKBigInteger(string:"1")
    var next_number:JKBigInteger
    var i:Int = 2

    repeat {
      next_number = n1 + n2
      i += 1
      n1 = n2
      n2 = next_number
    } while next_number.stringValue().unicodeScalars.count < 1000

    print("fib(\(i)) is longer than 1000 digits")
  }
}

class Problem25BigNumIterativeWithByteCount: EulerProblem {
  let thousandDigitByteSize = thousandDigitBigNum().countBytes()

  func check(num:JKBigInteger) -> Bool {
    if num.countBytes() < thousandDigitByteSize {
      return true
    }
    return num.stringValue().utf16.count < 1000
  }

  // problem finished in 0.0239300131797791 seconds
  override func run() {
    var n1 = JKBigInteger(string:"0")
    var n2 = JKBigInteger(string:"1")
    var next_number:JKBigInteger
    var i:Int = 2

    repeat {
      next_number = n1 + n2
      i += 1
      n1 = n2
      n2 = next_number
    } while check(next_number)

    print("fib(\(i)) is longer than 1000 digits")
  }
}
