//
//  Math.swift
//  TipsyAppObjc
//
//  Created by Jasur Salimov on 2/4/22.
//

import Foundation
@objc(Math)

class Math: NSObject{
   @objc func add(numOne: Int, numTwo: Int) -> Int{
        let sum = numOne + numTwo
        return sum
    }
   @objc func subtract(numOne: Int, numTwo: Int)-> Int{
        let sum = numOne - numTwo
        return sum
    }
   @objc func divide(numOne: Int, numTwo: Int)-> Float{
        let sum:Float = Float(numOne/numTwo)
        return sum
    }
   @objc func multiply(numOne: Int, numTwo: Int) ->Float{
        let sum:Float = Float(numOne/numTwo)
        return sum
    }
   @objc func random()->Int{
        return Int.random(in: 1...10000)
    }
}
