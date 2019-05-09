//
//  ViewController.swift
//  20190502_CoreData
//
//  Created by student on 2019/5/2.
//  Copyright © 2019年 student. All rights reserved.
//
// Device: iPhone 8 Plus

import UIKit
import CoreData

class ViewController: UIViewController {

    var userArr: [Username] = []
    
    @IBOutlet weak var userInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // let appDelegate = UIApplication.shared.delegate as! AppDelegate
        // let context = appDelegate.persistentContainer.viewContext
        
        // 寫資料
        /*
        let user = Users(context: context)
        
        user.name = "Trump"
        user.age = 87
        
        do {
            try context.save()
            print(user.name!)
        } catch  {
            print("wow much can't save")
        }
        */
        
        // 抓資料
        /*
        let fetchRequest = NSFetchRequest<Users>(entityName: "Users")
        fetchRequest.returnsObjectsAsFaults = false
        do {
            userArr = try context.fetch(fetchRequest)
            //print(userArr)
            if userArr.count > 0 {
                for user in userArr {
                    print("User Name:", user.name!, ", and age is:", user.age)
                }
            }
        } catch {
            print("wow much failed.")
        }
         */
    }

    
    @IBAction func letMeIn(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let user = Username(context: context)
        if userInput.text != nil {
            user.userid = userInput.text
        
            do {
                try context.save()
                print(user.userid!)
            } catch  {
                print("wow much can't save")
            }
        } else {
            print("Empty Data.")
        }
    }
    
    
    
    

}

