import Foundation

func + (lhs:JKBigInteger, rhs:JKBigInteger) -> JKBigInteger {
  return lhs.add(rhs) as! JKBigInteger
}

public func == (lhs: JKBigInteger, rhs: JKBigInteger) -> Bool {
  return lhs.compare(rhs) == NSComparisonResult.OrderedSame
}
