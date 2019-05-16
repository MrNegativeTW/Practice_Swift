//
//  ViewController.swift
//  20190516_APIDemo
//
//  Created by student on 2019/5/16.
//  Copyright © 2019年 TxWStudio. All rights reserved.
//
// Swift Version: 4.2
//
// 安裝 Ruby 套件
// sudo gem install cocoapods -n /usr/local/bin
// pod setup
//
// Download CocoaPods.app, and paste these
// pod 'Alamofire'
// pod 'SwiftyJSON'

import UIKit


class ViewController: UIViewController {

    
    // Open Weather API Key: 4bd72a4d3a28f977a15d5bb1888dad51
    // Open Weather Data Source: https://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=4bd72a4d3a28f977a15d5bb1888dad51
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        notUsingCocoapods()
        // usingCocoapods()
        
    } // .viewDidLoad

    
    func notUsingCocoapods() {
        let myUrl = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Pingtung,TW&appid=4bd72a4d3a28f977a15d5bb1888dad51")
        
        let urlRequests = URLRequest(url: myUrl!)
        
        let task = URLSession.shared.dataTask(with: urlRequests) { (data , response, error) in
            
            if error != nil {
                
                print(error)
                
            } else {
                
                if let jsonData = data {
                    
                    do {
                        
                        let jsonResult = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as! NSDictionary
                        print("Your Location:", jsonResult["name"]!)
                        
                        // Handle Double Array
                        if let weather = jsonResult["weather"] as? NSArray {
                            //print(weather[0])
                            
                            if let content = weather[0] as? NSDictionary {
                                if let description = content["description"] {
                                    print(description)
                                } // .description
                            } // .content
                        } // .Handle Double Array - weather
                        
                    } catch {
                        print("Can't get your data, fuck you loser.")
                    } // .do-catch
                    
                } // .if Statements  - Second
                
            } // .if Statements - First
            
        } // .task
        
        task.resume()
        
    } // .notUsingCocoapods
    
    
    func usingCocoapods() {
        
        
        
    } // .usingCocoapods
    
    
}

