//
// A palindromic number reads the same both ways. The largest palindrome made
// from the product of two 2-digit numbers is 9009 = 91 × 99.
//
// Find the largest palindrome made from the product of two 3-digit numbers.
//

final class Problem4: EulerProblem {
  final override func run() {
    var palindromes:[Int] = []
    for i in 100...999 {
      for j in 100...999 {
        if (i*j).isPalindrome() {
          palindromes.append(i*j)
        }
      }
    }
    
    sort(&palindromes) { $0 > $1 }
    
    println("number of palindromes = \(palindromes.count)")
    println("max palindrome = \(palindromes[0])")
  }
  
}
