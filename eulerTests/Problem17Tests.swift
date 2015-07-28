import Foundation
import Cocoa
import XCTest

var p17 = Problem17()

class Problem17Tests: XCTestCase {
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testIntToWords() {
    XCTAssertTrue(999.toWords() == "nine hundred and ninety-nine" , "999 -> nine hundred and ninety-nine")
    XCTAssertTrue(342.toWords() == "three hundred and forty-two" , "342 -> three hundred and forty-two")
    XCTAssertTrue(312.toWords() == "three hundred and twelve" , "312 -> three hundred and twelve")
    XCTAssertTrue(99.toWords()  == "ninety-nine" , "99 -> ninety-nine")
    XCTAssertTrue(90.toWords()  == "ninety" , "90 -> ninety")
    XCTAssertTrue(12.toWords()  == "twelve" , "12 -> twelve")
    XCTAssertTrue(10.toWords()  == "ten" , "10 -> ten")
    XCTAssertTrue(7.toWords()   == "seven" , "7 -> seven")
  }
  
  func testRemoveSpacesAndDashes() {
    XCTAssertTrue(999.toWords() == "nine hundred and ninety-nine" , "999 -> ninehundredandninetynine")
    XCTAssertTrue(342.toWords() == "three hundred and forty-two" , "342 -> threehundredandfortytwo")
    XCTAssertTrue(312.toWords() == "three hundred and twelve" , "312 -> threehundredandtwelve")
    XCTAssertTrue(99.toWords()  == "ninety-nine" , "99 -> ninetynine")
    XCTAssertTrue(90.toWords()  == "ninety" , "90 -> ninety")
    XCTAssertTrue(12.toWords()  == "twelve" , "12 -> twelve")
    XCTAssertTrue(10.toWords()  == "ten" , "10 -> ten")
    XCTAssertTrue(7.toWords()   == "seven" , "7 -> seven")
  }
  
}
