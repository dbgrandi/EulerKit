import Cocoa
import XCTest
import Nimble

class palindromeTest: XCTestCase {

  func testIsPalindrome() {
    expect(111.isPalindrome()).to(beTruthy())
    expect(1111.isPalindrome()).to(beTruthy())
    expect(121.isPalindrome()).to(beTruthy())
    expect(123456789987654321.isPalindrome()).to(beTruthy())

    expect(123.isPalindrome()).to(beFalsy())
    expect(1233221.isPalindrome()).to(beFalsy())
    expect(123456789087654321.isPalindrome()).to(beFalsy())
  }

//  func testIsPalindromePerformance() {
//    self.measureBlock() {
//      for i in 0...10000 {
//        p4.isPalindrome(995000 + i)
//      }
//    }
//  }

}
