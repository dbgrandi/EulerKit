import QuartzCore

class Stopwatch {
  let name:String
  var startTime:CFTimeInterval
  var runtime:CFTimeInterval

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
    self.startTime = 0
  }
  
  func start() {
    startTime = CACurrentMediaTime()
  }
  
  func stop() {
    runtime = CACurrentMediaTime() - startTime
  }
  
  func stats() {
//    println("\(name) finished in \(runtime) seconds")
    print(NSString(format:"%@ finished in %.5f seconds", name, runtime))
  }

}
