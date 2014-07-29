//
// By considering the terms in the Fibonacci sequence whose values do not
// exceed four million, find the sum of the even-valued terms.
//

//
// An infinite sequence of Fibonacci numbers
//
class FibonacciSequence: Sequence {
    func generate() -> GeneratorOf<Int> {
        var a = 0
        var b = 1
        
        return GeneratorOf<Int> {
            let sum = a + b
            a = b
            b = sum
            return sum
        }
    }
}

//
// A wrapper to stop a Sequence when it grows to
// a maximum value.
//
class MaxLimitSequence<S: Sequence, T where T == S.GeneratorType.Element, T:Comparable>: Sequence {
    let max:T
    var sequence:S

    init(max:T, sequence:S) {
        self.max = max
        self.sequence = sequence
    }
    
    func generate() -> GeneratorOf<T> {
        var generator = self.sequence.generate()

        return GeneratorOf<T> {
            var next = generator.next()
            if next != .None && next < self.max {
                return next
            }
            return .None
        }
    }
}

let seq = MaxLimitSequence(max:4_000_000, sequence:FibonacciSequence())
let sum = filter(seq, { $0 % 2 == 0 }).reduce(0,+)
println("sum = \(sum)")
