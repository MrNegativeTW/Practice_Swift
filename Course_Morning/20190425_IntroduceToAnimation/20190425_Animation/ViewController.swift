//
//  ViewController.swift
//  20190425_IntroduceToAnimation
//
//  Created by Trevor Wu on 2019/4/25.
//  Copyright © 2019年 TxW Studio. All rights reserved.
//
// Device: iPhone 8 Plus

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var blue: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        blue.center.y = blue.center.y - blue.frame.height
        
        // 手刻 View
        let greenView = UIView.init()
        greenView.frame = CGRect(x: 0, y: 75, width: 414, height: 75)
        greenView.backgroundColor = UIColor(red: 0/255, green: 255/255, blue: 190/255, alpha: 1)
        view.addSubview(greenView)
        
        // 手刻 View2
        let redView = UIView.init()
        redView.frame = CGRect(x: 0, y: 150, width: view.frame.width / 1/2, height: 75)
        redView.center.x = view.frame.width * 1/2
        redView.center.y = view.frame.height * 1/2
        redView.backgroundColor = UIColor(red: 255/255, green: 65/255, blue: 54/255, alpha: 1)
        view.addSubview(redView)
        
        // 手刻 Label
        let label2 = UILabel()
        label2.frame = CGRect(x: 0, y: 0, width: redView.frame.width, height: redView.frame.height)
        label2.text = "我是紅色三角形"
        label2.textAlignment = .center
        label2.textColor = UIColor.white
        redView.addSubview(label2) // 注意：往 redView 加
        
    }

    override func viewDidAppear(_ animated: Bool) {
        
        
        UIView.animate(withDuration: 0.5) {
            self.blue.center.y = self.blue.center.y + self.blue.frame.height
        }
        
        
        
        
    }
    
}
