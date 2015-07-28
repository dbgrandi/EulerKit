import Foundation

import Cocoa
import XCTest

var p16 = Problem16()

class Problem16Tests: XCTestCase {
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testSumOfDigits() {
    XCTAssertTrue(sumOfDigits("1")    == 1, "sum of 1 = 1")
    XCTAssertTrue(sumOfDigits("12")   == 3, "sum of 12 = 3")
    XCTAssertTrue(sumOfDigits("123")  == 6, "sum of 123 = 6")
    XCTAssertTrue(sumOfDigits("1234") == 10, "sum of 1234 = 10")
  }
  
  func testDoubleIntegerString() {
    XCTAssertTrue(p16.doubleIntegerString("1") == "2", "1*2 = 2")
    XCTAssertTrue(p16.doubleIntegerString("2") == "4", "2*2 = 4")
    XCTAssertTrue(p16.doubleIntegerString("11") == "22", "11*2 = 22")
    XCTAssertTrue(p16.doubleIntegerString("4096") == "8192", "4096*2 = 2")
  }
  
  func testPowerDigitSum() {
    XCTAssertTrue(p16.powerDigitSum(1) == 2, "sum of 2^1 = 2")
    XCTAssertTrue(p16.powerDigitSum(2) == 4, "sum of 2^2 = 4")
    XCTAssertTrue(p16.powerDigitSum(3) == 8, "sum of 2^3 = 8")
    XCTAssertTrue(p16.powerDigitSum(4) == 7, "sum of 2^2 = 7")
  }
}
