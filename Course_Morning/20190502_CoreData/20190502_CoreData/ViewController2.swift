//
//  ViewController2.swift
//  20190502_CoreData
//
//  Created by student on 2019/5/2.
//  Copyright © 2019年 student. All rights reserved.
//
// Device: iPhone 8 Plus
// THESE CODE CAN'T WORK, ALREADY SPEND FEW HOURS TRY GET THESE CODE TO WORK.

import UIKit
import CoreData

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // var users: [Users] = []
    var users: [Username] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        fetch()
    }
    
    @IBAction func letMeBak(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func fetch() {
        let appDelegate =  UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Username>(entityName: "Username")
        do {
            users = try context.fetch(fetchRequest)
        } catch {
            print("Runtime Error.")
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Rows:" , users.count)
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // TODO: Type 'UITableViewCell' has no member 'CellStyle'
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = users[indexPath.row].userid
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
