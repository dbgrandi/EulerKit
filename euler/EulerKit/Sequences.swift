//
// sequence tools
//

extension SequenceOf<T> {
  func last() -> T {
    var g = self.generate()
    var n = nil
    while let _ = g.next() {
      n++
    }
    return n
  }
}

//
// An infinite sequence of integers starting from n
//
struct IntSequence : SequenceType
{
  var start = 0
  init(start:Int) {
    self.start = start
  }

  func generate() -> GeneratorOf<Int> {
    var n : Int = start
    return GeneratorOf<Int> {
      return n++
    }
  }
}

//
// An infinite sequence of Fibonacci numbers
//
class FibonacciSequence: SequenceType {
  func generate() -> GeneratorOf<Int> {
    var last = 0
        var current = 1

        return GeneratorOf<Int> {
            let next = last + current
            last = current
            current = next
            return next
        }
    }
}

//
// An infinite sequence of Prime numbers
//

class PrimeSequence: SequenceType {
    func generate() -> GeneratorOf<Int> {
        var currentPrime = 1
        var nextPrime = 1

        return GeneratorOf<Int> {
            nextPrime = currentPrime+1
            while !nextPrime.isPrime() {
                nextPrime += 1
            }
            currentPrime = nextPrime
            return nextPrime
        }
    }
}

//
// An infinite sequence of Triangle numbers
//
class TriangleNumberSequence: SequenceType {
  func generate() -> GeneratorOf<Int> {
    var current = 0
    var count = 0

    return GeneratorOf<Int> {
      count += 1
      current = current + count
      return current
    }
  }
}

//
// A wrapper to stop a Sequence when it grows to
// a maximum value.
//
struct LimitSequence<S: SequenceType, T where T == S.Generator.Element>: SequenceType {
    let test: (Int,T) -> Bool
    let sequence: S

    init(sequence:S, test: (Int,T) -> Bool) {
        self.sequence = sequence
        self.test = test
    }

    func generate() -> GeneratorOf<T> {
        var generator = self.sequence.generate()
        let t = test
        var counter:Int = 0

        return GeneratorOf<T> {
            var next = generator.next()
            counter += 1
            if next != nil && t(counter, next!) {
                return next
            }
            return .None
        }
    }
}

class MappingSequence<S: SequenceType, U,  T where T == S.Generator.Element>: SequenceType {
  let sequence: S
  let map: (T) -> U

  init(sequence:S, map: (T) -> U) {
    self.sequence = sequence
    self.map = map
  }

  func generate() -> GeneratorOf<U> {
    var generator = self.sequence.generate()

    return GeneratorOf<U> {
      var next = generator.next()
      if next != nil {
        return self.map(next!)
      }
      return .None
    }
  }
}
