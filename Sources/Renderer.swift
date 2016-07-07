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
// Renderer.swift
// 07/04/2016
// -----------------------------------------------------------------------------

import Foundation

/// ...
public protocol Renderer {

    /// ...
    func render<RenderContext: Context>(primitive: Primitive, using context: RenderContext)
}

/// ...
public final class PrintRenderer: Renderer {
    
    /// ...
    public func render<RenderContext: Context>(primitive: Primitive, using context: RenderContext) {
        switch primitive {
        case .circle(let circle):
            render(circle:circle, using:context)
        case .ellipse(let ellipse):
            render(ellipse:ellipse, using:context)
        }
    }
    
    /// ...
    public func render<RenderContext: Context>(circle: Circle, using context: RenderContext) {
        let x = circle.x.evaluate(inside:context)
        let y = circle.y.evaluate(inside:context)
        let radius = circle.radius.evaluate(inside:context)
        print("render: \(circle)")
        print("  x = \(x)")
        print("  y = \(y)")
        print("  radius = \(radius)")
    }
    
    /// ...
    public func render<RenderContext: Context>(ellipse: Ellipse, using context: RenderContext) {
        let x = ellipse.x.evaluate(inside:context)
        let y = ellipse.y.evaluate(inside:context)
        let radiusX = ellipse.radiusX.evaluate(inside:context)
        let radiusY = ellipse.radiusY.evaluate(inside:context)
        print("render: \(ellipse)")
        print("  x = \(x)")
        print("  y = \(y)")
        print("  radiusX = \(radiusX)")
        print("  radiusY = \(radiusY)")
    }
}
