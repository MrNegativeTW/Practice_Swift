//
//  ViewController.swift
//  Timer
//
//  Created by student on 2019/3/21.
//  Copyright © 2019年 TxWStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    var timer = Timer()
    var second: Int = 0
    var isStart: Bool = false
    
   
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBAction func start(_ sender: Any) {
        if isStart == false {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(processTimer), userInfo: nil, repeats: true)
            
            timer.fire()
            
            isStart = true
            
        } else/* if isStart */{
            timer.invalidate()
            isStart = false
        }
    }
    
    
    @IBAction func pause(_ sender: Any) {
        timer.invalidate()
        isStart = false
    }
    

    @IBAction func refresh(_ sender: Any) {
        second = 0
        isStart = false
        timer.invalidate()
        
        timeLabel.text = "0"
    }
    
    
    @objc func processTimer() {
        second += 1
        timeLabel.text = String(second)
    }
    
    
    
    
    
    
}

