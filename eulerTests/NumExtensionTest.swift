//
//  NumExtensionTest.swift
//  euler
//
//  Created by David Grandinetti on 3/21/15.
//  Copyright (c) 2015 David Grandinetti. All rights reserved.
//

import Cocoa
import XCTest
import Nimble

class NumExtensionTest: XCTestCase {

  func testGetDigits() {
    expect(111.getDigits()).to(equal([1,1,1]))
  }

}
