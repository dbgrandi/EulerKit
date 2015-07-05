//
// A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
//
// a2 + b2 = c2
// For example, 32 + 42 = 9 + 16 = 25 = 52.
//
// There exists exactly one Pythagorean triplet for which a + b + c = 1000.
// Find the product abc.
//

final class Problem9: EulerProblem {
  final override func run() {
    for a in 1...999 {
      for b in 1...999 {
        for c in 1...999 {
          if isTriple(a, b:b, c:c) {
            print("Triple found: a = \(a), b = \(b), c = \(c)")
            print("Product = \(a*b*c)")
          }
        }
      }
    }
  }
  
  final func isTriple(a:Int, b:Int, c:Int) -> Bool {
    return (a+b+c == 1000) && (a<b && b<c) && ((a*a + b*b) == c*c)
  }
}

