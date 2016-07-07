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
// Primitive.swift
// 07/04/2016
// -----------------------------------------------------------------------------

import Foundation

/// ...
public struct Circle {
    
    /// ...
    public var x: FloatingPointExpression
    
    /// ...
    public var y: FloatingPointExpression
    
    /// ...
    public var radius: FloatingPointExpression
    
    //    /// ...
    //    public var strokeWidth: T
    //
    //    /// ...
    //    public var stroke: RGBAColor<UInt8>
    //
    //    /// ...
    //    public var fill: RGBAColor<UInt8>
}

/// ...
extension Circle: CustomStringConvertible {
    
    public var description: String {
        return "Circle(x = \(x), y = \(y), radius = \(radius))"
    }
}

/// ...
public struct Ellipse {
    
    /// ...
    public var x: FloatingPointExpression
    
    /// ...
    public var y: FloatingPointExpression
    
    /// ...
    public var radiusX: FloatingPointExpression
    
    /// ...
    public var radiusY: FloatingPointExpression
}

/// ...
extension Ellipse: CustomStringConvertible {
    
    public var description: String {
        return "Ellipse(x = \(x), y = \(y), radiusX = \(radiusX), radiusY = \(radiusY))"
    }
}

/// ...
public enum Primitive {
    
    /// ...
    case circle(Circle)

    /// ...
    case ellipse(Ellipse)
}

/// ...
extension Primitive: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .circle(let circle):
            return circle.description
        case .ellipse(let ellipse):
            return ellipse.description
        }
    }
}

