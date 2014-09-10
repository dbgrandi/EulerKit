//
//  Problem4Tests.swift
//  euler
//
//  Created by David Grandinetti on 9/2/14.
//  Copyright (c) 2014 David Grandinetti. All rights reserved.
//

import Cocoa
import XCTest

var p4 = Problem4()

class Problem4Tests: XCTestCase {

  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

  func testIsPalindrome() {
    XCTAssertTrue(p4.isPalindrome(111), "111 should be a palindrome")
    XCTAssertTrue(p4.isPalindrome(1111), "1111 should be a palindrome")
    XCTAssertTrue(p4.isPalindrome(121), "121 should be a palindrome")
    XCTAssertTrue(p4.isPalindrome(1111), "1111 should be a palindrome")
    XCTAssertTrue(p4.isPalindrome(123456789987654321), "123456789987654321 should be a palindrome")
    
    XCTAssertFalse(p4.isPalindrome(123), "123 should NOT be a palindrome")
    XCTAssertFalse(p4.isPalindrome(1233221), "1233221 should NOT be a palindrome")
    XCTAssertFalse(p4.isPalindrome(123456789087654321), "123456789087654321 should NOT be a palindrome")
  }

//  func testIsPalindromePerformance() {
//    self.measureBlock() {
//      for i in 0...10000 {
//        p4.isPalindrome(995000 + i)
//      }
//    }
//  }

}
