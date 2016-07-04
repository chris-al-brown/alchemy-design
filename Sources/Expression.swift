// -----------------------------------------------------------------------------
// Copyright (c) 2016, Christopher A. Brown (chris-al-brown)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
// AlchemyDesign
// Expression.swift
// 07/04/2016
// -----------------------------------------------------------------------------

import Foundation

/// ...
//public enum Expression<T: Primitive where T.Constant.RawValue == T.Variable.RawValue, T.Constant.RawValue == T.UnaryOperator.RawValue, T.Constant.RawValue == T.BinaryOperator.RawValue> {

/// ...
public enum Expression<T: Primitive> {
    
    /// ...
    case constant(T.Constant)
    
    /// ...
    case variable(T.Variable)
    
    /// ...
    indirect case unary(T.UnaryOperator, Expression<T>)
    
    /// ...
    indirect case binary(T.BinaryOperator, Expression<T>, Expression<T>)
    
    /// ...
    public init(_ value: T.Constant) {
        self = .constant(value)
    }
    
    /// ...
    public init(_ value: T.Constant.RawValue) {
        self = .constant(T.Constant(value))
    }
    
    /// ...
    public init(_ value: T.Variable) {
        self = .variable(value)
    }
    
//    /// ...
//    public func evaluate(inside context: Context) -> RawValue {
//        switch self {
//        case .constant(let c):
//            return c.rawValue
//        case .variable(let v):
//            return v.evaluate(inside:context)
//        case .unary(let op, let exp):
//            let arg = exp.evaluate(inside:context)
//            return op.evaluate(argument:arg)
//        case .binary(let op, let lhs, let rhs):
//            let arg1 = lhs.evaluate(inside:context)
//            let arg2 = rhs.evaluate(inside:context)
//            return op.evaluate(lhs:arg1, rhs:arg2)
//        }
//    }
    
}

/// ...
extension Expression: CustomStringConvertible {
    
    /// ...
    public var description: String {
        switch self {
        case .constant(let c):
            return String(c)
        case .variable(let v):
            return String(v)
        case .unary(let op, let exp):
            return "\(op) \(exp)"
        case .binary(let op, let lhs, let rhs):
            return "\(op) \(lhs) \(rhs)"
        }
    }
}


///// ...
//public func &&(lhs: BooleanOperator, rhs: BooleanOperator) -> BooleanOperator {
//    return .and(lhs, rhs)
//}
//
///// ...
//public func ||(lhs: BooleanOperator, rhs: BooleanOperator) -> BooleanOperator {
//    return .or(lhs, rhs)
//}
//
///// ...
//public prefix func !(op: BooleanOperator) -> BooleanOperator {
//    return .not(op)
//}
//
///// ...
//public enum BooleanOperator {
//    
//    /// ...
//    case `let`(BooleanConstant)
//    
//    /// ...
//    case `var`(BooleanVariable)
//    
//    /// ...
//    indirect case and(BooleanOperator, BooleanOperator)
//    
//    /// ...
//    indirect case or(BooleanOperator, BooleanOperator)
//    
//    /// ...
//    indirect case not(BooleanOperator)
//}
//
///// ...
//extension BooleanOperator: CustomStringConvertible {
//    
//    public var description: String {
//        switch self {
//        case .let(let value):
//            return value.description
//        case .var(let value):
//            return value.description
//        case .and(let lhs, let rhs):
//            return "( \(lhs) && \(rhs) )"
//        case .or(let lhs, let rhs):
//            return "( \(lhs) || \(rhs) )"
//        case .not(let expr):
//            return "!( \(expr) )"
//        }
//    }
//}
//
///// ...
//public func +(lhs: FloatingOperator, rhs: FloatingOperator) -> FloatingOperator {
//    return .add(lhs, rhs)
//}
//
///// ...
//public func sin(_ op: FloatingOperator) -> FloatingOperator {
//    return .sin(op)
//}
//
///// ...
//public enum FloatingOperator {
//    
//    /// ...
//    case `let`(FloatingConstant)
//    
//    /// ...
//    case `var`(FloatingVariable)
//    
//    /// ...
//    indirect case sin(FloatingOperator)
//    
//    /// ...
//    indirect case add(FloatingOperator, FloatingOperator)
//}
//
///// ...
//extension FloatingOperator: CustomStringConvertible {
//    
//    public var description: String {
//        switch self {
//        case .let(let value):
//            return value.description
//        case .var(let value):
//            return value.description
//        case .sin(let value):
//            return "sin( \(value) )"
//        case .add(let lhs, let rhs):
//            return "( \(lhs) + \(rhs) )"
//        }
//    }
//}
//
///// ...
//public func +(lhs: IntegerOperator, rhs: IntegerOperator) -> IntegerOperator {
//    return .add(lhs, rhs)
//}
//
///// ...
//public func %(lhs: IntegerOperator, rhs: IntegerOperator) -> IntegerOperator {
//    return .mod(lhs, rhs)
//}
//
///// ...
//public enum IntegerOperator {
//    
//    /// ...
//    case `let`(IntegerConstant)
//    
//    /// ...
//    case `var`(IntegerVariable)
//    
//    /// ...
//    indirect case add(IntegerOperator, IntegerOperator)
//    
//    /// ...
//    indirect case mod(IntegerOperator, IntegerOperator)
//}
//
///// ...
//extension IntegerOperator: CustomStringConvertible {
//    
//    public var description: String {
//        switch self {
//        case .let(let value):
//            return value.description
//        case .var(let value):
//            return value.description
//        case .mod(let value, let modulus):
//            return "( \(value) % \(modulus) )"
//        case .add(let lhs, let rhs):
//            return "( \(lhs) + \(rhs) )"
//        }
//    }
//}
