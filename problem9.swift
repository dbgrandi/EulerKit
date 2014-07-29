//
// A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
//
// a2 + b2 = c2
// For example, 32 + 42 = 9 + 16 = 25 = 52.
//
// There exists exactly one Pythagorean triplet for which a + b + c = 1000.
// Find the product abc.
//

for a in 1...999 {
  for b in 1...999 {
    for c in 1...999 {
      if a+b+c == 1000 {
        if a < b && b < c {
          if (a*a + b*b) == (c*c) {
            println("Triple found: a = \(a), b = \(b), c = \(c)")
            println("Product = \(a*b*c)")
          }
        }
      }
    }
  }
}