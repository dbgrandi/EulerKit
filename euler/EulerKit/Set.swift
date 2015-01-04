class Set<T:Hashable> {
  var items = [T: Bool]()

  func count() -> Int {
    return items.count
  }

  func reduce<U>(initial:U, combine:(U, T) -> U) -> U {
    return items.keys.reduce(initial, combine:combine)
  }

  func insert(item:T) {
    items[item] = true
  }
}
