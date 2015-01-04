class Set<T:Hashable> {
  var items = [T]()

  func count() -> Int {
    return items.count
  }

  func reduce<U>(initial:U, combine:(U, T) -> U) -> U {
    return items.reduce(initial, combine:combine)
  }

  func insert(item:T) {
    if !contains(items, {$0 == item}) {
      items.append(item)
    }
  }
}
