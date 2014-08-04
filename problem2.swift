//
// By considering the terms in the Fibonacci sequence whose values do not
// exceed four million, find the sum of the even-valued terms.
//

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
// A wrapper to stop a Sequence when it grows to
// a maximum value.
//
class MaxLimitSequence<S: SequenceType, T where T == S.Generator.Element, T:Comparable>: SequenceType {
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
