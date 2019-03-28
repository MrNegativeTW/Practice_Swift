//
//  main.swift
//  20190328_FuncAsPara
//
//  Created by Trevor Wu on 2019/3/28.
//  Copyright © 2019年 TxWStudio. All rights reserved.
//

import Foundation

//  User input, type: String
print("What do you want to do ? ", terminator: "")
let action = readLine()
print("and the first number is ? ", terminator: "")
let strA = readLine()
print("second number ? ", terminator: "")
let strB = readLine()

//  Turn to Int
let intA = Int(strA!)
let intB = Int(strB!)

//  Add
func addOperation(a: Int, b: Int) -> Int {
    return a + b
}

//  Subtract
func subOperation(a: Int, b: Int) -> Int {
    return a - b
}

//  Multiplication
func mulOperation(a: Int, b: Int) -> Int {
    return a * b
}

//  Division
func divOperation(a: Int, b: Int) -> Int {
    return a / b
}

/// Decide which func to call
///
/// - Parameters:
///   - action: The action user want to do, Add/Subtract/Multiplication/Division.
///   - a: First number for calc.
///   - b: Second number for calc.
/// - Returns: Calc result of numbers
func actionOperation(action: String, a: Int, b: Int) -> Int {
    switch action {
    case "addOperation":
        return addOperation(a: intA!, b: intB!)
    case "subOperation":
        return subOperation(a: intA!, b: intB!)
    case "mulOperation":
        return mulOperation(a: intA!, b: intB!)
    case "divOperation":
        return divOperation(a: intA!, b: intB!)
    default:
        return 0
    }
}

/// Start process what user want
let result = actionOperation(action: action!, a: intA!, b: intB!)
print("Result: \(result)")


// Test Area, damn
//
//func actionOperation2(actionOperations: (Int, Int) -> Int, a: Int, b:Int) {
//    print(actionOperations(a, b))
//}
//
//actionOperation2(actionOperations: addOperation, a: intA!, b: intB!)


//  Test Area, shit
//
//func chooseFunction(increment: Bool) -> (Int, Int) -> Int {
//    if increment {
//        return addOperation
//    } else {
//        return subOperation
//    }
//}
//if act == 1 {
//    var bools = true
//    let result = chooseFunction(increment: bools)
//    print(result)
//}
