//
// A palindromic number reads the same both ways. The largest palindrome made
// from the product of two 2-digit numbers is 9009 = 91 × 99.
//
// Find the largest palindrome made from the product of two 3-digit numbers.
//

func isPalindrome(i:Int) -> Bool {
    let digits = toDigitArray(i)
    var first = 0
    var last = digits.count-1
    while first < last {
        if digits[first] != digits[last] {
            return false
        }
        first+=1
        last-=1
    }
    return true
}

func toDigitArray(i:Int) -> [Int] {
    var num = i
    var digitArray:[Int] = []
    while num >= 10 {
        digitArray.insert(num%10, atIndex:0)
        num = num / 10
    }
    digitArray.insert(num, atIndex: 0)
    return digitArray
}

var palindromes:[Int] = []
for i in 100...999 {
    if i % 100 == 0 {
        println(i)
    }
    for j in 100...999 {
        if isPalindrome(i*j) {
            palindromes.append(i*j)
        }
    }
}

sort(&palindromes) { $0 > $1 }

println("number of palindromes = \(palindromes.count)")
println("max palindrome = \(palindromes[0])")