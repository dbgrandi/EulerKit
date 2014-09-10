extension Int {
  func factorial() -> Int {
    if self == 1 {
      return 1
    }
    return self * (self-1).factorial()
  }
}


//binomial_coefficient = (n, k) ->
//  result = 1
//  for i in [0...k]
//    result *= (n - i) / (i + 1)
//  result
//
//n = 5
//for k in [0..n]
//console.log "binomial_coefficient(#{n}, #{k}) = #{binomial_coefficient(n,k)}"

func binaryCoefficient(n:Int, k:Int) -> Int {
  var result = 1
  for i in 0..<k {
    result = result * (n-i)/(i+1)
  }
  return result
}

println(binaryCoefficient(40,20))
println(137846528820)