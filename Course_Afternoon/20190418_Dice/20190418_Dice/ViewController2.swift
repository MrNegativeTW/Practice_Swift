//
//  ViewController2.swift
//  20190418_Dice
//
//  Created by Trevor Wu on 2019/4/18.
//  Copyright © 2019年 TxWStudio. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    
    @IBOutlet weak var totalPointText: UILabel!
    @IBOutlet weak var winOrLoseText: UILabel!
    
    var totalPoint: String!
    var bigOrSmall: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        totalPointText.text = totalPoint
        winOrLoseText.text = bigOrSmall
        winOrLose()
    }

    func winOrLose() {
        let i = Int(totalPoint)!
        if bigOrSmall == "押大"{
            if i > 6 {
                winOrLoseText.text = "Alright, you got it."
            }
            if i < 7 {
                winOrLoseText.text = "You loser lol"
            }
        } else if bigOrSmall == "押小" {
            if i < 6 {
                winOrLoseText.text = "Alright, you got it."
            }
            if i > 7 {
                winOrLoseText.text = "You loser lol"
            }
        }
    }
    
    @IBAction func back(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
