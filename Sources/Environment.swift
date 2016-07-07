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
// Environment.swift
// 07/07/2016
// -----------------------------------------------------------------------------

import Foundation
import AlchemyRandom

/// ...
public protocol Environment {

    /// ...
    func randomBinaryOperator() -> FloatingPointBinaryOperator
    
    /// ...
    func randomConstant() -> FloatingPointConstant

    /// ...
    func randomExpression() -> FloatingPointExpression

    /// ...
    func randomUnaryOperator() -> FloatingPointUnaryOperator
    
    /// ...
    func randomValue() -> FloatingPointType
    
    /// ...
    func randomVariable() -> FloatingPointVariable
  
    /// ...
    var binaryOps: Set<FloatingPointBinaryOperator> { get }
    
    /// ...
    var constants: Set<FloatingPointConstant> { get }

    /// ...
    var unaryOps: Set<FloatingPointUnaryOperator> { get }
    
    /// ...
    var values: Set<FloatingPointType> { get }
    
    /// ...
    var variables: Set<FloatingPointVariable> { get }
}

/// ...
public final class CoreEnvironment: Environment {
    
    /// ...
    public init() {
        self.binaryOps = FloatingPointBinaryOperator.allOperators
        self.constants = FloatingPointConstant.allConstants
        self.unaryOps = FloatingPointUnaryOperator.allOperators
        self.values = [0.0, 1.0]
        self.variables = FloatingPointVariable.allVariables
        self.random = MersenneTwister(source:Arc4Random())
    }
    
    /// ...
    public func randomBinaryOperator() -> FloatingPointBinaryOperator {
        let offset = random.nextInt(lessThan:binaryOps.count)
        let index = binaryOps.index(binaryOps.startIndex, offsetBy:offset)
        return binaryOps[index]
    }

    /// ...
    public func randomConstant() -> FloatingPointConstant {
        let offset = random.nextInt(lessThan:constants.count)
        let index = constants.index(constants.startIndex, offsetBy:offset)
        return constants[index]
    }
    
    /// ...
    public func randomExpression() -> FloatingPointExpression {
        switch random.nextInt(lessThan:5) {
        case 0:
            return Expression(randomConstant())
        case 1:
            return Expression(randomValue())
        case 2:
            return Expression(randomVariable())
        case 3:
            return Expression(randomUnaryOperator(), randomExpression())
        case 4:
            return Expression(randomBinaryOperator(), randomExpression(), randomExpression())
        default:
            return Expression(randomValue())
        }
    }

    /// ...
    public func randomUnaryOperator() -> FloatingPointUnaryOperator {
        let offset = random.nextInt(lessThan:unaryOps.count)
        let index = unaryOps.index(unaryOps.startIndex, offsetBy:offset)
        return unaryOps[index]
    }

    /// ...
    public func randomValue() -> FloatingPointType {
        let offset = random.nextInt(lessThan:values.count)
        let index = values.index(values.startIndex, offsetBy:offset)
        return values[index]
    }

    /// ...
    public func randomVariable() -> FloatingPointVariable {
        let offset = random.nextInt(lessThan:variables.count)
        let index = variables.index(variables.startIndex, offsetBy:offset)
        return variables[index]
    }

    /// ...
    public var binaryOps: Set<FloatingPointBinaryOperator>

    /// ...
    public var constants: Set<FloatingPointConstant>

    /// ...
    public var unaryOps: Set<FloatingPointUnaryOperator>

    /// ...
    public var values: Set<FloatingPointType>

    /// ...
    public var variables: Set<FloatingPointVariable>
    
    /// ...
    private var random: MersenneTwister
}

/// ...
extension CoreEnvironment: CustomStringConvertible {

    public var description: String {
        return "CoreEnvironment(constants = \(constants), values = \(values), variables = \(variables))"
    }
}
