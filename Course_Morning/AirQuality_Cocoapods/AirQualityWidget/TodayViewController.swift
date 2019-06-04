//
//  TodayViewController.swift
//  AirQualityWidget
//
//  Created by Trevor Wu on 2019/5/2.
//  Copyright © 2019年 TxWStudio. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var widgetText: UILabel!
    
    // Declear UserDefault
    let myUserDefault = UserDefaults(suiteName: "group.com.txwstudio.trevorwu.AirQuality")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        
        widgetText.text = self.myUserDefault!.value(forKey: "aqiDataforWidget") as? String
        //widgetText.text = "wow no content"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        /*widgetText.text = self.myUserDefault!.value(forKey: "aqiDataforWidget") as? String*/
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
