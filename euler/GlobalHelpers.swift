//
// global helper functions
//

func invertDict<U, T>(dict:Dictionary<U,T>) -> Dictionary<T,U> {
  var invertedDict = Dictionary<T,U>()
  for (key, value) in dict {
    invertedDict[value] = key
  }
  return invertedDict
}

func binaryCoefficient(n:Int, k:Int) -> Int {
  return (0..<k).reduce(1) { $0 * (n-$1)/($1+1) }
}
