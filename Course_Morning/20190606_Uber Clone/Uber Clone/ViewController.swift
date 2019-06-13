//
//  ViewController.swift
//  Uber Clone
//
//  Created by Trevor Wu on 2019/6/6.
//  Copyright © 2019年 Trevor Wu. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var userModeSwitch: UISwitch!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    @IBAction func login(_ sender: Any) {
        // Check text field is empty or not.
        if emailTextField.text != nil && passwordTextField.text != nil {
            // Start auth
            authUser(email: emailTextField.text!, password: passwordTextField.text!)
        } else {
            displayAlert(title: "Hey you", msg: "Type in something")
        }
    } // .Login Button
    
    
    func authUser(email: String, password: String) {
        
        // wowfuckingtest2@gmail.com, 000000
        
        Auth.auth().signIn(withEmail: email, password: password) { (authDataResult, error) in
            if error != nil {
                
                let errorMsg = String(describing: (error! as NSError).userInfo["FIRAuthErrorUserInfoNameKey"])
                if errorMsg == "Optional(ERROR_USER_NOT_FOUND)" {
                    
                    // 建立新使用者
                    Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                        if error != nil {
                            self.displayAlert(title: "使用者建立失敗", msg: "Firebase Success Error")
                            print(errorMsg)
                        } else {
//                            self.displayAlert(title: "使用者建立成功", msg: "Firebase Success")
//                            print(errorMsg)
                            
                            if self.userModeSwitch.isOn {
                                // 建立乘客
                                self.displayAlert(title: "乘客建立成功", msg: "Firebase Success")
                                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                                changeRequest?.displayName = "乘客"
                                changeRequest?.commitChanges(completion: nil)
                                
                                
                            } else {
                                // 建立司機
                                self.displayAlert(title: "司機建立成功", msg: "Firebase Success")
                                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                                changeRequest?.displayName = "司機"
                                changeRequest?.commitChanges(completion: nil)
                                
                                
                            }
                        }
                    }) // .createUser()
                    
                } else if errorMsg == "Optional(ERROR_INVALID_EMAIL)"{
                    // E-Mail 錯誤
                    self.displayAlert(title: "E-Mail 錯誤", msg: "請檢查格式")
                    print(errorMsg)
                } else {
                    // 無法識別的錯誤
                    self.displayAlert(title: "無法識別的錯誤", msg: "Stack.Overflow.Error")
                    print(errorMsg)
                }
                
            } else {
                // Success Login
                // self.displayAlert(title: "您已登入", msg: "Firebase Success")
                if Auth.auth().currentUser?.displayName == "乘客" {
//                  self.performSegue(withIdentifier: "PassengerView", sender: self)
                    self.performSegue(withIdentifier: "DriverView", sender: self)
                } else if Auth.auth().currentUser?.displayName == "司機"{
                    self.performSegue(withIdentifier: "DriverView", sender: self)
                }
                
                
                
            }
            
        } // .Auth.signIn
        
        
    } // .authUser
    

    func displayAlert(title: String, msg: String) {
        // If something goes wrong, display a dialog box.
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "好", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    } // .displayAlert
    
    
    

} // .class

