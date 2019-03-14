//
//  main.swift
//  20190314_Class
//
//  Created by student on 2019/3/14.
//  Copyright © 2019年 TxwStudio. All rights reserved.
//

import Foundation

//print("Hello, World!")

var myCar = Car(customColor: "Blue")

print(myCar.color)
print(myCar.seat)
myCar.printOut()


var Ecar = ElectricCar(customColor: "white")
print(Ecar.power)
/* Override 之後的成果 */
Ecar.printOut()
