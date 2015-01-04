//
//  JKBigNum.swift
//  euler
//
//  Created by David Grandinetti on 12/31/14.
//  Copyright (c) 2014 David Grandinetti. All rights reserved.
//

func + (lhs:JKBigInteger, rhs:JKBigInteger) -> JKBigInteger {
  return lhs.add(rhs) as JKBigInteger
}

extension JKBigInteger