import Cocoa
import XCTest
import Nimble

class NumExtensionTest: XCTestCase {

  func testGetDigits() {
    expect(111.getDigits()).to(equal([1,1,1]))
  }

}
