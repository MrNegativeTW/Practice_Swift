//
//  FirstViewController.swift
//  20190328_Notepad
//
//  Created by student on 2019/3/28.
//  Copyright © 2019年 TxWStudio. All rights reserved.
//
//  Device: iPhone XS Max
//
import UIKit

class FirstViewController: UIViewController, UITabBarDelegate, UITableViewDataSource{

    
    var items: [String] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    /* Rerender table when switch back */
    override func viewDidAppear(_ animated: Bool) {
        // Get array
        let itemObj = UserDefaults.standard.object(forKey: "userInput")
        
        if let tempItem = itemObj as? [String] {
            items = tempItem
            tableView.reloadData()
        }
    }
    
    
    /* Return how many rows to render */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    /* Render Table */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellObj = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        
        // Loop through whole array
        cellObj.textLabel?.text = items[indexPath.row]
        
        // Print it
        return cellObj
    }

    
    /* Delete Note */
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            items.remove(at: indexPath.row)
            tableView.reloadData()
            UserDefaults.standard.set(items, forKey: "userInput")
        }
    }
    
    
}

