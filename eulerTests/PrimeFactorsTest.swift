import Cocoa
import XCTest
import Nimble

class PrimeFactorsTest: XCTestCase {
  func testPrimeFactors() {
    expect(29.primeFactors()).to(equal([29]))
    let factors = 13195.primeFactors()
    expect(factors.count).to(equal(4))
    println(factors)
    XCTAssertTrue(13195.primeFactors() == [5,7,13,29], "prime factors of 13195 are 5,7,13,29")
  }
}