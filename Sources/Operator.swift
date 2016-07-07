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
public protocol BinaryOperator: Hashable {

    /// ...
    associatedtype Value

    /// ...
    static var allOperators: Set<Self> { get }

    /// ...
    func describe(left: String, right: String) -> String

    /// ...
    func evaluate(left: Value, right: Value) -> Value
}

/// ...
public enum FloatingPointBinaryOperator: BinaryOperator {

    /// ...
    public typealias Value = FloatingPointType

    /// ...
    public static var allOperators: Set<FloatingPointBinaryOperator> {
        return [.add, .divide, .multiply, .subtract]
    }

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
public protocol UnaryOperator: Hashable {
    
    /// ...
    associatedtype Value
    
    /// ...
    static var allOperators: Set<Self> { get }
    
    /// ...
    func describe(input: String) -> String
    
    /// ...
    func evaluate(input: Value) -> Value
}

/// ...
public enum FloatingPointUnaryOperator: UnaryOperator {
    
    /// ...
    public typealias Value = FloatingPointType

    /// ...
    public static var allOperators: Set<FloatingPointUnaryOperator> {
        return [.cosine, .exponentiation, .logarithm, .sine]
    }

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
