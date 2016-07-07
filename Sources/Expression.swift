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
public enum Expression<
    Value,
    Let: Constant,
    Var: Variable,
    UnaryOp: UnaryOperator,
    BinaryOp: BinaryOperator
    where
    Let.Value == Value,
    Var.Value == Value,
    UnaryOp.Value == Value,
    BinaryOp.Value == Value>
{
    /// ...
    public typealias Argument = Expression<Value, Let, Var, UnaryOp, BinaryOp>
    
    /// ...
    case constant(Let)
    
    /// ...
    case value(Value)
    
    /// ...
    case variable(Var)
    
    /// ...
    indirect case unary(UnaryOp, Argument)
    
    /// ...
    indirect case binary(BinaryOp, Argument, Argument)
    
    /// ...
    public init(_ value: Value) {
        self = .value(value)
    }
    
    /// ...
    public init(_ constant: Let) {
        self = .constant(constant)
    }
    
    /// ...
    public init(_ variable: Var) {
        self = .variable(variable)
    }
    
    /// ...
    public init(_ op: UnaryOp, _ arg: Argument) {
        self = .unary(op, arg)
    }

    /// ...
    public init(_ op: BinaryOp, _ arg1: Argument, _ arg2: Argument) {
        self = .binary(op, arg1, arg2)
    }

    /// ...
    public func evaluate<Ctx: Context>(inside context: Ctx) -> Value {
        switch self {
        case .constant(let c):
            return c.value
        case .value(let v):
            return v
        case .variable(let v):
            return v.evaluate(inside:context)
        case .unary(let op, let arg):
            return op.evaluate(input:arg.evaluate(inside:context))
        case .binary(let op, let arg1, let arg2):
            let lhs = arg1.evaluate(inside:context)
            let rhs = arg2.evaluate(inside:context)
            return op.evaluate(left:lhs, right:rhs)
        }
    }
}

/// ...
extension Expression: CustomStringConvertible {

    /// ...
    public var description: String {
        switch self {
        case .constant(let c):
            return String(c)
        case .value(let v):
            return String(v)
        case .variable(let v):
            return String(v)
        case .unary(let op, let arg):
            return op.describe(input:arg.description)
        case .binary(let op, let arg1, let arg2):
            return op.describe(left:arg1.description, right:arg2.description)
        }
    }
}

/// ...
public typealias FloatingPointType = Double

/// ...
public typealias FloatingPointExpression = Expression<FloatingPointType, FloatingPointConstant, FloatingPointVariable, FloatingPointUnaryOperator, FloatingPointBinaryOperator>





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
