import Cocoa
import XCTest
import Nimble

var p15 = Problem15()

class Problem15Tests: XCTestCase {
  func testBinaryCoefficient() {
    XCTAssertTrue(binaryCoefficient(5, 0) == 1,  "5 choose 0 = 1")
    XCTAssertTrue(binaryCoefficient(5, 1) == 5,  "5 choose 1 = 5")
    XCTAssertTrue(binaryCoefficient(5, 2) == 10, "5 choose 2 = 10")
    XCTAssertTrue(binaryCoefficient(5, 3) == 10, "5 choose 3 = 10")
    XCTAssertTrue(binaryCoefficient(5, 4) == 5,  "5 choose 4 = 5")
    XCTAssertTrue(binaryCoefficient(5, 5) == 1,  "5 choose 5 = 1")
  }
}
