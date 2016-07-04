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
// Demo.playground
// 07/01/2016
// -----------------------------------------------------------------------------

import Foundation
import AlchemyDesign

/**
 
 Constant
 An invariant from program start to program finish
 e.g. the width or height of the canvas
 
 Variable
 A deterministic or stochastic source of variation
 e.g. deterministic -> current x position or lattice index
 e.g. stochastic -> uniformly generated random number between 0.0 and 1.0
 
 Operators
 Transformations of constants, variables, and other operators into higher order operators
 e.g. boolean: x > 10.0 (... problem as it is a comparison of two floating operators)
 e.g. floating: sin ( x ) + 1.0
 e.g. integer: depth % 2
 
 
 How best to deal with expression reduction/compilation?
 - going to generate a lot of bloat and need to reduce to smaller trees if possible
 
 How best to deal with sources of randomness? (use _Variable to represent)
 - Noise
 - Perlin
 - Simplex
 - Random
 - Uniform
 - Poisson
 - Gaussian
 - LogNormal
 
 How best to deal with geometric primitives?
 - Circle
 - Ellipse
 - Line
 - PolyLine
 - Triangle
 - Square
 - Rectangle
 - Polygon(n)
 
 How best to deal with lattices (repetition)?
 - Bravais
 - Geometric (Circle, Square, etc.)
 - CirclePacking
 - Penrose
 - Voronoii
 - PoissonDisc
 
 How best to deal with control flow expressions?
 - e.g. (BooleanOperator) ? (FloatingOperator) : (IntegerOperator)
 - e.g. for FloatingOperator in [FloatingOperator] { ... }
 
 **/

///// ...
//public func randomFloatingConstant() -> FloatingConstant {
//    var arc4 = Arc4Random()
//    switch arc4.nextRandomDouble() {
//    case 0..<0.5:
//        return FloatingConstant.pi
//    case 0.5..<1.0:
//        return FloatingConstant.halfPi
//    default:
//        return FloatingConstant.pi
//    }
//}
//
///// ...
//public enum Primitive {
//    
//    /// ...
//    case circle(x: FloatingOperator, y: FloatingOperator, radius: FloatingOperator)
//}
//
///// ...
//extension Primitive: CustomStringConvertible {
//    
//    public var description: String {
//        switch self {
//        case .circle(let x, let y, let radius):
//            return "circle( \(x), \(y), \(radius) )"
//        }
//    }
//}
//
//sizeof(FloatingConstant)
//sizeof(FloatingOperator)
//sizeof(FloatingVariable)
//
//sizeof(BooleanConstant)
//sizeof(BooleanOperator)
//sizeof(BooleanVariable)
//
//sizeof(IntegerConstant)
//sizeof(IntegerOperator)
//sizeof(IntegerVariable)
//
//sizeof(Primitive)
//
////var c1: CustomConstant<Double> = CustomConstant(value:1.0)
////var c2: CustomConstant<Int> = CustomConstant(value:10, description:"ten")
//
//let r1: FloatingConstant = .pi
//let i1: IntegerConstant = .layerCount
//
//let b1: BooleanConstant = BooleanConstant.randomConstant()
//let b2: BooleanConstant = BooleanConstant.randomConstant()
//
//let bool: BooleanOperator = !((.var(.uniform) || .let(.true)) && (.let(b1) || .let(b2)))
//let real: FloatingOperator = sin(.let(r1) + .let(randomFloatingConstant())) + .var(.uniform(0.0, 1.0))
//let disc: IntegerOperator = (.let(i1) + .let(i1)) % .var(.uniform(-10, 10))
//
//let circle: Primitive = .circle(x:.let(r1), y:.let(r1), radius:real)


