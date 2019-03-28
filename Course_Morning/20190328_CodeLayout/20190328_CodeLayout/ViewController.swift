//
//  ViewController.swift
//  20190328_CodeLayout
//
//  Created by student on 2019/3/28.
//  Copyright © 2019年 TxWStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // No idea
        let square = UIView(frame: CGRect(x: view.frame.width / 2, y: view.frame.height / 2, width: 100, height: 100))
        square.backgroundColor = UIColor.green
        
        view.addSubview(square)
    }


}

