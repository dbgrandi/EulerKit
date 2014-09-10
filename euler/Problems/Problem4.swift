//
// A palindromic number reads the same both ways. The largest palindrome made
// from the product of two 2-digit numbers is 9009 = 91 × 99.
//
// Find the largest palindrome made from the product of two 3-digit numbers.
//

class Problem4: EulerProblem {
  override func run() {
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
  }
  
  func isPalindrome(i:Int) -> Bool {
    let digits = Array(String(i))
    var first = 0
    var last = digits.count-1
    while first < last {
      if digits[first] != digits[last] {
        return false
      }
      first++
      last--
    }
    return true
  }
}
