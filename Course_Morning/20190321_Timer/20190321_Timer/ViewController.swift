//
//  ViewController.swift
//  20190321_Timer
//
//  Created by Trevor Wu on 2019/3/24.
//  Copyright © 2019年 TxWStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /*
     * Project Format: Xcode 8.0-compatible
     * Deployment Target: 11.2
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var timer = Timer()
    var second: Int = 0
    var minute: Int = 0
    var hour: Int = 0
    var isStart: Bool = false
    
    @IBOutlet weak var hourTimeLabel: UILabel!
    @IBOutlet weak var minTimeLabel: UILabel!
    @IBOutlet weak var secTimeLabel: UILabel!
    
    @IBAction func start(_ sender: UIBarButtonItem) {
        if isStart == false {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(processTimer), userInfo: nil, repeats: true)
            
            timer.fire()
            
            isStart = true
        }
    }
    
    @IBAction func pause(_ sender: UIBarButtonItem) {
        timer.invalidate()
        isStart = false
    }
    
    
    @IBAction func refresh(_ sender: UIBarButtonItem) {
        second = 0
        minute = 0
        hour = 0
        isStart = false
        timer.invalidate()
        
        hourTimeLabel.text = "wow"
        minTimeLabel.text = "much"
        secTimeLabel.text = "timer"
        
        self.navigationItem.leftBarButtonItem?.isEnabled = true
    }
    
    @objc func processTimer() {
        second += 1
        secTimeLabel.text = String(second)
        
        if second == 60 {
            minute += 1
            second = 0
            secTimeLabel.text = String(second)
            minTimeLabel.text = String(minute)
        }
        
        if minute == 60 {
            hour += 1
            minute = 0
            minTimeLabel.text = String(minute)
            hourTimeLabel.text = String(hour)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

