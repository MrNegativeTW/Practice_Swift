//
//  TodayViewController.swift
//  AirQualityWidget
//
//  Created by Trevor Wu on 2019/5/2.
//  Copyright © 2019年 TxWStudio. All rights reserved.
//

import UIKit
import NotificationCenter
import Alamofire
import SwiftyJSON

var mySelect = 0

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var widgetText: UILabel!
    
    // Declear UserDefault
    let myUserDefault = UserDefaults(suiteName: "group.com.txwstudio.trevorwu.AirQuality")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        
        getAirData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        widgetText.text = self.myUserDefault!.value(forKey: "aqiDataforWidget") as? String
        
        
    }
    
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        getAirData()
        
        completionHandler(NCUpdateResult.newData)
    }
    
    
    var arrayAQI = ["取得中..."]
    /// I am limited by the technology of my time. ![](https://i.imgflip.com/2uzxes.jpg)
    /// The code below should work, but because some reason it can't,
    /// seems to have some internet connection issue,
    /// there are tons of guy facing the same issue
    /// but can't find the answer on stack overflow or somewhere.
    /// Error: Failed to inherit CoreMedia permissions from 1841: (null)
    /// [Most upvotes answer](https://stackoverflow.com/questions/26091463/today-extension-failed-to-inherit-coremedia-permissions-from/28693435#28693435)
    func getAirData() {
        let url = "https://opendata.epa.gov.tw/ws/Data/AQI/?$format=json"
        Alamofire.request(url).responseJSON { (response) in
            if response.result.isSuccess {
                
                let json: JSON = JSON(response.result.value!)
                
                self.arrayAQI.removeAll()
                
                for (_, subJson):(String, JSON) in json {
                    let AQI = subJson["AQI"].string
                    self.arrayAQI.append(AQI!)
                }
                self.widgetText.text = "Testing"
            } else if response.result.isFailure {
                self.widgetText.text = "喔不，出問題了"
            }
            
        } // .Alamofire responseJSON
        
        let id = UserDefaults.standard.integer(forKey: "mySelect")
        if self.arrayAQI.count != 1 {
            self.widgetText.text = arrayAQI[id]
        }
        
    } // .getAirData()
}
