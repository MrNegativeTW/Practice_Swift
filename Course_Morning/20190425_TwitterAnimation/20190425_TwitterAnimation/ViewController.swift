//
//  ViewController.swift
//  20190425_TwitterAnimation
//
//  Created by student on 2019/4/25.
//  Copyright © 2019年 TxW Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let twitterIcon = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.init(red: 29/255, green: 202/255, blue: 255/255, alpha: 1)
        twitterIcon.image = UIImage(named: "Twitter_Logo_White_On_Image")
        twitterIcon.frame = CGRect(x: 147, y: 308, width: 120, height: 120)
        twitterIcon.center = view.center
        
        view.addSubview(twitterIcon)

    }

    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.5, animations: {
            self.twitterIcon.frame = CGRect(x: 147, y: 308, width: 60, height: 60)
            self.twitterIcon.center = self.view.center
        }) { (finished) in
            UIView.animate(withDuration: 0.7, animations: {
                self.twitterIcon.frame = CGRect(x: 0, y: 0, width: 10000, height: 10000)
                self.twitterIcon.center = self.view.center
                self.view.alpha = 0
            })
        }
    }
    
    
}

