//
//  ViewController.swift
//  20190321
//
//  Created by student on 2019/3/21.
//  Copyright © 2019年 TxWStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let label = UILabel()
        label.backgroundColor = UIColor.lightGray
        label.text = "Goodbye World!"
        label.textColor = UIColor.cyan
        
        /* 關閉自動處理的功能，全手動指定 */
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        /* 手動指定位置 */
        label.heightAnchor.constraint(equalToConstant: 22).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
}

