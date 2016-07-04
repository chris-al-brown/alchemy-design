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
// AlchemyDesignTests.swift
// 07/01/2016
// -----------------------------------------------------------------------------

import XCTest
@testable import AlchemyDesign

/// ...
class AlchemyDesignTests: XCTestCase {

    /// ...
    func testCircle() {
        let x: Expression<Double> = Expression(0.0)
        let y: Expression<Double> = Expression(.e)
        let radius: Expression<Double> = Expression(.width)
        var circle: Circle<Double>= Circle(x:x, y:y, radius:radius)
        
        var context = TestContext()
        
//        switch circle.radius {
//        case .constant(_):
//            break
//        case .variable(let v):
//            v.evaluate(inside:context)
//        case .unary(let op, let exp):
//            break
//        case .binary(let op, let lhs, let rhs):
//            break
//        }
        
    }
    
    /// ...
    static var allTests : [(String, (AlchemyDesignTests) -> () throws -> Void)] {
        return [
            ("testCircle", testCircle),
        ]
    }
}
