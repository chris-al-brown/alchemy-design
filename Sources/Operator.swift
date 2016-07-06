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
// Operator.swift
// 07/04/2016
// -----------------------------------------------------------------------------

import Foundation
import AlchemyRandom

/// ...
public protocol BinaryOperator {

    /// ...
    associatedtype Value

    /// ...
    func describe(left: String, right: String) -> String

    /// ...
    func evaluate(left: Value, right: Value) -> Value
}

/// ...
public enum DoubleBinaryOperator: BinaryOperator {

    /// ...
    public typealias Value = Double

    /// ...
    case add

    /// ...
    case divide

    /// ...
    case multiply

    /// ...
    case subtract

    /// ...
    public func describe(left: String, right: String) -> String {
        switch self {
        case .add:
            return "(\(left) + \(right))"
        case .divide:
            return "(\(left) / \(right))"
        case .multiply:
            return "(\(left) * \(right))"
        case .subtract:
            return "(\(left) - \(right))"
        }
    }

    /// ...
    public func evaluate(left: Value, right: Value) -> Value {
        switch self {
        case .add:
            return left + right
        case .divide:
            return left / right
        case .multiply:
            return left * right
        case .subtract:
            return left - right
        }
    }
}

/// ... 
public protocol UnaryOperator {
    
    /// ...
    associatedtype Value
    
    /// ...
    func describe(input: String) -> String
    
    /// ...
    func evaluate(input: Value) -> Value
}

/// ...
public enum DoubleUnaryOperator: UnaryOperator {
    
    /// ...
    public typealias Value = Double

    /// ...
    case cosine

    /// ...
    case exponentiation

    /// ...
    case logarithm

    /// ...
    case sine

    /// ...
    public func describe(input: String) -> String {
        switch self {
        case .cosine:
            return "cos(\(input))"
        case .exponentiation:
            return "exp(\(input))"
        case .logarithm:
            return "log(\(input))"
        case .sine:
            return "sin(\(input))"
        }
    }

    /// ...
    public func evaluate(input: Value) -> Value {
        switch self {
        case .cosine:
            return cos(input)
        case .exponentiation:
            return exp(input)
        case .logarithm:
            return log(input)
        case .sine:
            return sin(input)
        }
    }
}

///// ...
//public protocol BinaryOperatorProtocol {
//    
//    /// ...
//    associatedtype RawValue
//    
//    /// ...
//    init<RNG: RandomNumberGenerator>(random: inout RNG)
//
//    /// ...
//    func describe(lhs: String, rhs: String) -> String
//
//    /// ...
//    func evaluate(lhs: RawValue, rhs: RawValue) -> RawValue
//}
//
///// ...
//public protocol UnaryOperatorProtocol {
//
//    /// ...
//    associatedtype RawValue
//    
//    /// ...
//    init<RNG: RandomNumberGenerator>(random: inout RNG)
//
//    /// ...
//    func describe(expression: String) -> String
//    
//    /// ...
//    func evaluate(argument: RawValue) -> RawValue
//}
//
///// ...
//public enum FloatingPointBinaryOperator: BinaryOperatorProtocol {
//    
//    /// ...
//    public typealias RawValue = Double
//    
//    /// ...
//    case add
//
//    /// ...
//    case divide
//
//    /// ...
//    case multiply
//
//    /// ...
//    case subtract
//    
//    /// ...
//    public init<RNG: RandomNumberGenerator>(random: inout RNG) {
//        switch random.nextInt(lessThan:4) {
//        case 0:
//            self = .add
//        case 1:
//            self = .divide
//        case 2:
//            self = .multiply
//        case 3:
//            self = .subtract
//        default:
//            self = .add
//        }
//    }
//
//    /// ...
//    public func describe(lhs: String, rhs: String) -> String {
//        switch self {
//        case .add:
//            return "(\(lhs) + \(rhs))"
//        case .divide:
//            return "(\(lhs) / \(rhs))"
//        case .multiply:
//            return "(\(lhs) * \(rhs))"
//        case .subtract:
//            return "(\(lhs) - \(rhs))"
//        }
//    }
//
//    /// ...
//    public func evaluate(lhs: RawValue, rhs: RawValue) -> RawValue {
//        switch self {
//        case .add:
//            return lhs + rhs
//        case .divide:
//            return lhs / rhs
//        case .multiply:
//            return lhs * rhs
//        case .subtract:
//            return lhs - rhs
//        }
//    }
//}
//
///// ...
//public enum FloatingPointUnaryOperator: UnaryOperatorProtocol {
//    
//    /// ...
//    public typealias RawValue = Double
//
//    /// ...
//    case cosine
//
//    /// ...
//    case exponentiation
//    
//    /// ...
//    case logarithm
//    
//    /// ...
//    case sine
//
//    /// ...
//    public init<RNG: RandomNumberGenerator>(random: inout RNG) {
//        switch random.nextInt(lessThan:4) {
//        case 0:
//            self = .cosine
//        case 1:
//            self = .exponentiation
//        case 2:
//            self = .logarithm
//        case 3:
//            self = .sine
//        default:
//            self = .cosine
//        }
//    }
//
//    /// ...
//    public func describe(expression: String) -> String {
//        switch self {
//        case .cosine:
//            return "cos(\(expression))"
//        case .exponentiation:
//            return "exp(\(expression))"
//        case .logarithm:
//            return "log(\(expression))"
//        case .sine:
//            return "sin(\(expression))"
//        }
//    }
//
//    /// ...
//    public func evaluate(argument: RawValue) -> RawValue {
//        switch self {
//        case .cosine:
//            return Darwin.cos(argument)
//        case .exponentiation:
//            return Darwin.exp(argument)
//        case .logarithm:
//            return Darwin.log(argument)
//        case .sine:
//            return Darwin.sin(argument)
//        }
//    }
//}











