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
// Constant.swift
// 07/04/2016
// -----------------------------------------------------------------------------

import Foundation

/// ...
public protocol ConstantProtocol {
    
    /// ...
    associatedtype RawValue
    
    /// ...
    init(_ value: RawValue)

    /// ...
    var rawValue: RawValue { get }
}

/// ...
public enum FloatingPointConstant: ConstantProtocol {
    
    /// ...
    public typealias RawValue = Double
    
    /// ...
    case e
    
    /// ...
    case halfPi
    
    /// ...
    case pi
    
    /// ...
    case quarterPi
    
    /// ...
    case rawValue(RawValue)
    
    /// ...
    case sqrt2
    
    /// ...
    case sqrt3
    
    /// ...
    case twoPi
    
    /// ...
    public init(_ value: RawValue) {
        self = .rawValue(value)
    }
    
    /// ...
    public var rawValue: RawValue {
        switch self {
        case .e:
            return M_E
        case .halfPi:
            return .pi / 2
        case .pi:
            return .pi
        case .quarterPi:
            return .pi / 4
        case rawValue(let value):
            return value
        case .sqrt2:
            return sqrt(2)
        case .sqrt3:
            return sqrt(3)
        case .twoPi:
            return 2 * .pi
        }
    }
}

/// ...
extension FloatingPointConstant: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .e:
            return "e"
        case .halfPi:
            return "(π/2)"
        case .pi:
            return "π"
        case .quarterPi:
            return "(π/4)"
        case rawValue(let value):
            return String(value)
        case .sqrt2:
            return "√(2)"
        case .sqrt3:
            return "√(3)"
        case .twoPi:
            return "2π"
        }
    }
}




///// ...
//public enum BooleanConstant {
//    
//    /// ...
//    case `true`
//    
//    /// ...
//    case `false`
//}
//
///// ...
//extension BooleanConstant: CustomStringConvertible {
//    
//    public var description: String {
//        switch self {
//        case .true:
//            return "true"
//        case .false:
//            return "false"
//        }
//    }
//}
//
///// ...
//extension BooleanConstant: BooleanLiteralConvertible {
//    
//    public init(booleanLiteral value: Bool) {
//        self = value ? .true : .false
//    }
//}
//
///// ...
//public enum FloatingConstant {
//    
//    /// ...
//    case e
//    
//    /// ...
//    case halfPi
//    
//    /// ...
//    case height
//    
//    /// ...
//    case pi
//    
//    /// ...
//    case quarterPi
//    
//    /// ...
//    case sqrt2
//    
//    /// ...
//    case sqrt3
//    
//    /// ...
//    case twoPi
//    
//    /// ...
//    case width
//}
//
///// ...
//extension FloatingConstant: CustomStringConvertible {
//    
//    public var description: String {
//        switch self {
//        case .e:
//            return "e"
//        case .halfPi:
//            return "(π/2)"
//        case .height:
//            return "height"
//        case .pi:
//            return "π"
//        case .quarterPi:
//            return "(π/4)"
//        case .sqrt2:
//            return "√(2)"
//        case .sqrt3:
//            return "√(3)"
//        case .twoPi:
//            return "2π"
//        case .width:
//            return "width"
//        }
//    }
//}
//
///// ...
//public enum IntegerConstant {
//
//    /// ...
//    case height
//
//    /// ...
//    case layerCount
//    
//    /// ...
//    case width
//}
//
///// ...
//extension IntegerConstant: CustomStringConvertible {
//    
//    public var description: String {
//        switch self {
//        case .height:
//            return "height"
//        case .layerCount:
//            return "layerCount"
//        case .width:
//            return "width"
//        }
//    }
//}
