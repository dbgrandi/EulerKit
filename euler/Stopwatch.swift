import Foundation

class Stopwatch {
  var name:String!
  var startDate:NSDate!
  var runtime:NSTimeInterval!
  
  init(name:String) {
    self.name = name
    self.runtime = 0
  }
  
  func start() {
    startDate = NSDate()
  }
  
  func stop() {
    runtime = (-startDate.timeIntervalSinceNow)
  }
  
  func stats() {
    println("\(name) finished in \(runtime) seconds")
  }

  func measure(closure:()->()) {
    start()
    closure()
    stop()
    stats()
  }
}
