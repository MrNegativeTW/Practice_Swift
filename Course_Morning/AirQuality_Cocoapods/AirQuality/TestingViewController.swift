//
//  TestingViewController.swift
//  AirQuality
//
//  Created by Trevor Wu on 2019/6/21.
//  Copyright © 2019年 TxWStudio. All rights reserved.
//

import UIKit

class TestingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Declear UserDefault
    let myUserDefault = UserDefaults(suiteName: "group.com.txwstudio.trevorwu.AirQuality")
    
    var arrayPlace = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(arrayPlace)
        // Do any additional setup after loading the view.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayPlace.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cells", for: indexPath) as! TestingViewControllerCell
//        var cell = tableView.dequeueReusableCell(withIdentifier: "cells")
//        if cell == nil {
//            cell = UITableViewCell(style: .default, reuseIdentifier: "cells")
//        }
        
        
        
        cell.wowLabel.text = arrayPlace[indexPath.row]
        
        cell.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        mySelect = indexPath.row
        UserDefaults.standard.set(indexPath.row, forKey: "mySelect")
    }
    
}
