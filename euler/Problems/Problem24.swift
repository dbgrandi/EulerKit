//
// A permutation is an ordered arrangement of objects. For example, 3124 is
// one possible permutation of the digits 1, 2, 3 and 4. If all of the
// permutations are listed numerically or alphabetically, we call it
// lexicographic order. The lexicographic permutations of 0, 1 and 2 are:
//
// 012   021   102   120   201   210
//
// What is the millionth lexicographic permutation of the digits
// 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
//

class Problem24: EulerProblem {

  func findFirstDigit(n:[Int], goal:Int) -> Int {
    if n.count == 1 { return n.first! }
    
    let permSize = (n.count-1).factorial()
    if permSize*1 > goal { return n[0] }
    for i in 0..<n.count {
      if permSize*i >= goal {
        return n[i-1]
      }
    }
    
    return n.last!
  }
  
  func findNthPermutation(var n:[Int], var goal:Int) -> String {
    var result = ""
    var size:Int, digit:Int, index:Int
    
    while n.count > 1 {
      size = (n.count-1).factorial()
      digit = findFirstDigit(n,goal:goal)
      index = n.indexOf(digit)!
      
      goal -= size*index
      result += String(n.removeAtIndex(index))
    }
    
    return result + String(n[0])
  }

  override func run() {
    let n = [0,1,2,3,4,5,6,7,8,9]
    let result = findNthPermutation(n,goal:1000000)
    print("perms[999999] = \(result)")
  }
}
