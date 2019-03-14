//
//  ElectricCar.swift
//  20190314_Class
//
//  Created by student on 2019/3/14.
//  Copyright © 2019年 TxwStudio. All rights reserved.
//

import Foundation

// 繼承
class ElectricCar : Car{
    
    var power = "electric"
    
    /* Override 上層類別 */
    override func printOut() {
        
        /* super 可調用原本類別的東西 */
        /* printOut "This is a Gasoline Car."  */
        super.printOut()
        
        /* In Swift, null == nil */
//        if destination != nil {
//            print("This is a Electric Car. Destination is " + destination!)
//        }
        
        /* 已預先檢查使用者是否有賦值， */
        if let userDefineDestination = destination {
        print("This is a Electric Car. Destination is " + userDefineDestination)
        }
    }
    
    
    /*
     * 修飾符
     *  "?" 不確定這邊會有東西輸入
     *  "!" 確定這邊一定有東西會輸入，盡量避免使用
     */
    var destination: String?
    
    
}
