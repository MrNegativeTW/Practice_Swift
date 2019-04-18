//
//  ViewController.swift
//  20190418_Dice
//
//  Created by student on 2019/4/18.
//  Copyright © 2019年 TxWStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var leftDiceImage: UIImageView!
    @IBOutlet weak var rightDiceImage: UIImageView!
    @IBOutlet weak var sdfsdfs: UIButton!
    
    var diceIndex1: Int = 0
    var diceIndex2: Int = 0
    
    let diceImageArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        randomDice()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as!
        ViewController2
        
        //把segue.destination強制轉型成detailViewController
        
        controller.namessss = sdfsdfs.currentTitle
    }
    
    
    
    @IBAction func rollDice(_ sender: UIButton) {
        randomDice()
    }
    
    func randomDice() {
        diceIndex1 = Int(arc4random_uniform(UInt32(6)))
        leftDiceImage.image = UIImage(named: diceImageArray[diceIndex1])
        diceIndex2 = Int(arc4random_uniform(UInt32(6)))
        rightDiceImage.image = UIImage(named: diceImageArray[diceIndex2])
        
        var totalPoint = diceIndex1 + diceIndex2 + 2
        
    }
    
    
}

