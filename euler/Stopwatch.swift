class Stopwatch {
  var name:String!
  var startDate:NSDate!
  var runtime:NSTimeInterval!

  class func measure(name:String, closure:() -> ()) {
    let stopwatch = Stopwatch(name:name)
    stopwatch.start()
    closure()
    stopwatch.stop()
    stopwatch.stats()
  }

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
//    println("\(name) finished in \(runtime) seconds")
    print(NSString(format:"%@ finished in %.5f seconds", name, runtime))
  }

}
