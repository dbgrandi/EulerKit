//
// Found http://natecook.com/blog/2014/08/creating-a-set-type-in-swift/
// and took some ideas from Nate's impl.
//
struct Set<T:Hashable> {
  var items: [T: Bool]

  init() {
    items = [T: Bool]()
  }

  var count:Int { return items.count }

  func reduce<U>(initial:U, combine:(U, T) -> U) -> U {
    return Array(items.keys).reduce(initial, combine:combine)
  }

  mutating func insert(item:T) {
    items[item] = true
  }
}
