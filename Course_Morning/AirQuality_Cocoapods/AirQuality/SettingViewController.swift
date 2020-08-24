//
//  SettingViewController.swift
//  AirQuality
//
//  Created by Trevor Wu on 2019/6/15.
//  Copyright © 2019年 TxWStudio. All rights reserved.
//

import UIKit

//var mySelect = 0

class SettingViewController: UITableViewController {

    // Declear UserDefault
    let myUserDefault = UserDefaults(suiteName: "group.com.txwstudio.trevorwu.AirQuality")
    
    var arrayPlace = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayPlace.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.wowLabel.text = arrayPlace[indexPath.row]
        
        cell.tag = indexPath.row
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        mySelect = indexPath.row
        
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            UserDefaults.standard.set(indexPath.row, forKey: "mySelect")
            dismiss(animated: true, completion: nil)
        case .pad:
            UserDefaults.standard.set(indexPath.row, forKey: "mySelect")
        case .unspecified:
            UserDefaults.standard.set(indexPath.row, forKey: "mySelect")
        case .tv:
            UserDefaults.standard.set(indexPath.row, forKey: "mySelect")
        case .carPlay:
            UserDefaults.standard.set(indexPath.row, forKey: "mySelect")
        }
    }


}




