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
public protocol Variable: Hashable {
    
    /// ...
    associatedtype Value
    
    /// ...
    static var allVariables: Set<Self> { get }

    /// ...
    func evaluate<Ctx: Context>(inside context: Ctx) -> Value
}

/// ...
public enum FloatingPointVariable: Variable {
    
    /// ...
    public typealias Value = FloatingPointType
    
    /// ...
    public static var allVariables: Set<FloatingPointVariable> {
        return [.height, .width]
    }

    /// ...
    case height
    
    /// ...
    case width
    
    /// ...
    public func evaluate<Ctx: Context>(inside context: Ctx) -> Value {
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
