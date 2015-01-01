extension String {
  var length: Int { return countElements(self) }

  func repeat(i:Int) -> String {
    var result = ""
    for i in 0..<i {
      result += self
    }
    return result
  }

  subscript(i: Int) -> String {
    return String(Array(self)[i])
  }
}