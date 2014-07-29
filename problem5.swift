//
// 2520 is the smallest number that can be divided by each of
// the numbers from 1 to 10 without any remainder.
//
// What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
//

extension Int {
    func isDivisibleUpTo(max:Int) -> Bool {
        for i in stride(from: max, through: 2, by: -1) {
            if self % i != 0 {
                return false
            }
        }
        return true
    }
}

func smallestDivisibleUpTo(i:Int) -> Int {
    var n = 1
    while true {
        if n.isDivisibleUpTo(i) {
            return n
        }
        n += 1
    }
}

println(smallestDivisibleUpTo(20))
