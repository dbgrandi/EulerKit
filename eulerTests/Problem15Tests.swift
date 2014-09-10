//
//  Problem15Tests.swift
//  euler
//
//  Created by David Grandinetti on 9/10/14.
//  Copyright (c) 2014 David Grandinetti. All rights reserved.
//

import Cocoa
import XCTest

var p15 = Problem15()

class Problem15Tests: XCTestCase {
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testBinaryCoefficient() {
    XCTAssertTrue(p15.binaryCoefficient(5, k: 0) == 1,  "5 choose 0 = 1")
    XCTAssertTrue(p15.binaryCoefficient(5, k: 1) == 5,  "5 choose 1 = 5")
    XCTAssertTrue(p15.binaryCoefficient(5, k: 2) == 10, "5 choose 2 = 10")
    XCTAssertTrue(p15.binaryCoefficient(5, k: 3) == 10, "5 choose 3 = 10")
    XCTAssertTrue(p15.binaryCoefficient(5, k: 4) == 5,  "5 choose 4 = 5")
    XCTAssertTrue(p15.binaryCoefficient(5, k: 5) == 1,  "5 choose 5 = 1")
  }
}
