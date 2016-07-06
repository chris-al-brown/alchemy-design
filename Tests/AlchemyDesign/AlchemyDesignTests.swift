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
import AlchemyRandom
@testable import AlchemyDesign

/// ...
final class TestContext: Context {
    
    /// ...
    init() {
        var rng = Xoroshiro128Plus(source:Arc4Random())
        self.width = 640 * rng.nextDouble()
        self.height = 480 * rng.nextDouble()
    }
    
    /// ...
    var minimumLength: Double {
        return 1.0
    }
    
    /// ...
    var maximumLength: Double {
        return 10.0
    }
    
    /// ...
    var minimumX: Double {
        return 0.0
    }
    
    /// ...
    var maximumX: Double {
        return width
    }
    
    /// ...
    var minimumY: Double {
        return 0.0
    }
    
    /// ...
    var maximumY: Double {
        return height
    }
    
    /// ...
    let height: Double
    
    /// ...
    let width: Double
}

/// ...
final class TestRenderer: Renderer {
    
    /// ...
    func render(circle: Circle, inside context: Context) {
        let x = circle.x.evaluate(inside:context)
        let y = circle.y.evaluate(inside:context)
        let r = circle.radius.evaluate(inside:context)
        print("render: \(circle)")
        print("  x = \(x)")
        print("  y = \(y)")
        print("  radius = \(r)")
    }
}

/// ...
class AlchemyDesignTests: XCTestCase {
    
    /// ...
    func testCircle() {
        let x: Circle.X = Circle.X(.width)
        let y: Circle.Y = Circle.Y(-10.0)
        let radius: Circle.Radius = Circle.Radius(-1000)
        let circle = Circle(x:x, y:y, radius:radius)
        let context = TestContext()
        let renderer = TestRenderer()
        renderer.render(circle:circle, inside:context)
    }
    
    /// ...
    static var allTests : [(String, (AlchemyDesignTests) -> () throws -> Void)] {
        return [
            ("testCircle", testCircle),
        ]
    }
}
