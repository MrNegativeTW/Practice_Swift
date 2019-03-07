//
//  ViewController.swift
//  HelloWorld_20190307
//
//  Created by student on 2019/3/7.
//  Copyright © 2019年 TxWStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func button1(_ sender: Any) {
        if label1.text == "你剛剛摸了一下我" {
            label1.text = "這是一台 iPad Air 2"
        }else{
            label1.text = "你剛剛摸了一下我"
        }
    }
}

