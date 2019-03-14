//
//  Car.swift
//  20190314_Class
//
//  Created by student on 2019/3/14.
//  Copyright © 2019年 TxwStudio. All rights reserved.
//

import Foundation

// 枚舉 enumeration
enum CarType {
    case ModelS
    case Model3
    case ModelX
}

/* 類別第一字母大寫 */
class Car {
    
    // Attrubute
    var color = "red"
    var seat = 7
    var brand = "Tesla"
    
    
    init(customColor: String) {
        color = customColor
    }
    
    
    // Method
    func printOut() {
        print("This is a Gasoline Car.")
    }
    
    
    // 枚舉 enumeration
    var typeOfCar: CarType = CarType.ModelS
    /* 點會在自動去檢查前面的類別 */
    // var typeOfCar: CarType = .ModelS
    
    
    
    
    
}
