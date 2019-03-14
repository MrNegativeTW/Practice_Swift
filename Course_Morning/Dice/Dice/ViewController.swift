//
//  ViewController.swift
//  Dice
//
//  Created by student on 2019/3/7.
//  Copyright © 2019年 TxWStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var diceIndex1: Int = 0
    var diceIndex2: Int = 0
    
    /* Left & Right Side Image View */
    @IBOutlet weak var leftDice: UIImageView!
    @IBOutlet weak var rightDice: UIImageView!
    
    let diceImageArray = ["Dice1", "Dice2","Dice3","Dice4","Dice5","Dice6"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        diceIndex1 = Int(arc4random_uniform(UInt32(6)))
//        leftDice.image = UIImage(named: diceImageArray[diceIndex1])
//        diceIndex2 = Int(arc4random_uniform(UInt32(6)))
//        rightDice.image = UIImage(named: diceImageArray[diceIndex2])
        randomDice()
    }

    @IBAction func button1(_ sender: Any) {
        randomDice()
        /* Left side dice */
//        diceIndex1 = Int(arc4random_uniform(UInt32(6)))
//        leftDice.image = UIImage(named: diceImageArray[diceIndex1])
//        print("Dice1:", diceIndex1)
        
        
        /* Right side dice */
//        diceIndex2 = Int(arc4random_uniform(UInt32(6)))
//        rightDice.image = UIImage(named: diceImageArray[diceIndex2])
//        print("Dice2:", diceIndex2)
    }
    
    func randomDice() {
        diceIndex1 = Int(arc4random_uniform(UInt32(6)))
        leftDice.image = UIImage(named: diceImageArray[diceIndex1])
        diceIndex2 = Int(arc4random_uniform(UInt32(6)))
        rightDice.image = UIImage(named: diceImageArray[diceIndex2])
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == UIEvent.EventSubtype.motionShake {
            randomDice()
        }
    }
    
}

