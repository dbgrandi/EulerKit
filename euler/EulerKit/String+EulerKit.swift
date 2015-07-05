extension String {
  var length: Int { return self.characters.count }

  func `repeat`(i:Int) -> String {
    var result = ""
    for _ in 0..<i {
      result += self
    }
    return result
  }

  subscript(i: Int) -> String {
    return String(Array(self.characters)[i])
  }
}