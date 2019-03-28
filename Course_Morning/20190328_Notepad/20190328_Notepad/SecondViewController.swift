//
//  SecondViewController.swift
//  20190328_Notepad
//
//  Created by student on 2019/3/28.
//  Copyright © 2019年 TxWStudio. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var warnText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    /* Get rid of Keyboard when touch empty space */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    /* Get rid of Keyboard when hit return */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    /* Process Notes */
    @IBAction func saveButton(_ sender: UIButton) {
        var items: [String]
        let itemObj = UserDefaults.standard.object(forKey: "userInput")
        
        if textField.text != "" {
            if let tempItem = itemObj as? [String] {
                items = tempItem
                items.append(textField.text!)
                print(items)
                warnText.text = "Saved!"

                warnText.text = "A friendly message here."
            } else {
                items = [textField.text!]
            }
            
            UserDefaults.standard.set(items, forKey: "userInput")
            
            textField.text = ""
        } else if textField.text == ""{
            warnText.text = "Don't do that you son of _"
        }
        
    }
    
}
