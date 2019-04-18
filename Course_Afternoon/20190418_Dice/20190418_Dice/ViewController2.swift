//
//  ViewController2.swift
//  20190418_Dice
//
//  Created by student on 2019/4/18.
//  Copyright © 2019年 TxWStudio. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var totalPointText: UILabel!
    @IBOutlet weak var winOrLoseText: UILabel!
    
    var namessss: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //totalPointText.text = String(totalPoint)
        /*if totalPoint >= 7 {
            winOrLoseText.text = "贏家"
        } else if totalPoint <= 6{
            winOrLoseText.text = "輸家"
        }*/
    }
    

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
