//
//  JKBigNum.swift
//  euler
//
//  Created by David Grandinetti on 12/31/14.
//  Copyright (c) 2014 David Grandinetti. All rights reserved.
//

import Foundation

func + (lhs:JKBigInteger, rhs:JKBigInteger) -> JKBigInteger {
  return lhs.add(rhs) as! JKBigInteger
}

public func == (lhs: JKBigInteger, rhs: JKBigInteger) -> Bool {
  return lhs.compare(rhs) == NSComparisonResult.OrderedSame
}

extension JKBigInteger : Equatable {}
