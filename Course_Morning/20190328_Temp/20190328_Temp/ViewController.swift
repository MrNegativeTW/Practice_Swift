//
//  ViewController.swift
//  20190328_Temp
//
//  Created by student on 2019/3/28.
//  Copyright © 2019年 TxWStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    //let name = "Jeff"
    let arr = ["Tesla", 2019, true] as Any
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /* Example: String */
        UserDefaults.standard.set("Jeff", forKey: "name")
        let nameObjectA = UserDefaults.standard.object(forKey: "name")
        if let nameString = nameObjectA as? String {
            print(nameString)
        }
        //print(nameObject)
        
        
        /* Example: Array */
        UserDefaults.standard.set(arr, forKey: "info")
        let nameObjectB = UserDefaults.standard.object(forKey: "info")
        if let arrString = nameObjectB as? NSArray {
            print(arrString)
        }
        
        
    }
    
}
