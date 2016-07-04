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
// Variable.swift
// 07/04/2016
// -----------------------------------------------------------------------------

import Foundation

/// ...
public protocol VariableProtocol {
    
    /// ...
    associatedtype RawValue
    
    /// ...
    func evaluate(inside context: Context) -> RawValue
}

/// ...
public enum FloatingPointVariable: VariableProtocol {
    
    /// ...
    public typealias RawValue = Double
    
    /// ...
    case height
    
    /// ...
    case width
    
    /// ...
    public func evaluate(inside context: Context) -> RawValue {
        switch self {
        case .height:
            return context.height
        case .width:
            return context.width
        }
    }
}

/// ...
extension FloatingPointVariable: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .height:
            return "height"
        case .width:
            return "width"
        }
    }
}

///// ...
//public enum BooleanVariable {
//    
//    /// ...
//    case uniform
//}
//
///// ...
//extension BooleanVariable: CustomStringConvertible {
//    
//    public var description: String {
//        switch self {
//        case .uniform:
//            return "uniform()"
//        }
//    }
//}
//
///// ...
//public enum FloatingVariable {
//    
//    /// ...
//    case uniform(Double, Double)
//    
//    /// ...
//    case x
//    
//    /// ...
//    case y
//}
//
///// ...
//extension FloatingVariable: CustomStringConvertible {
//    
//    public var description: String {
//        switch self {
//        case .uniform(let min, let max):
//            return "uniform(\(min), \(max))"
//        case .x:
//            return "x"
//        case .y:
//            return "y"
//        }
//    }
//}
//
///// ...
//public enum IntegerVariable {
//    
//    /// ...
//    case depth
//    
//    /// ...
//    case uniform(Int, Int)
//    
//    /// ...
//    case xIndex
//    
//    /// ...
//    case yIndex
//}
//
///// ...
//extension IntegerVariable: CustomStringConvertible {
//    
//    public var description: String {
//        switch self {
//        case .depth:
//            return "depth"
//        case .uniform(let min, let max):
//            return "uniform(\(min), \(max))"
//        case xIndex:
//            return "xIndex"
//        case yIndex:
//            return "yIndex"
//        }
//    }
//}
