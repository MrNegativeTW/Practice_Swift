//
//  ViewController.swift
//  AirQuality
//
//  Created by Trevor Wu on 2019/4/17.
//  Copyright © 2019年 TxWStudio. All rights reserved.
//
// TODO:
// - Switch to MVVM(Massive View Controller) ?
// - Today extension update
// - passing data from tableview on select, or add static navigation bar.
//
// Done:
// - passing data to tableview
// - popover arrow position

// Documentation? Not today.

import UIKit
import Alamofire
import SwiftyJSON
import CoreLocation

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    // Declear UserDefault
    let myUserDefault = UserDefaults(suiteName: "group.com.txwstudio.trevorwu.AirQuality")
    
    
    @IBOutlet weak var unsplashImage: UIImageView!
    @IBOutlet weak var SiteName: UILabel!
    @IBOutlet weak var aqiData: UILabel!
    @IBOutlet weak var Status: UILabel!
    @IBOutlet weak var maskHint: UILabel!
    
    var arrayPlace = ["測站"]
    var arrayAQI = ["取得中..."]
    var arrayStatus = ["品質狀態"]
    var arrayPM25 = ["0"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        helloMessage()
        getAirData()
        getUnsplashImageWeb()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        // for iPhone
        print("[-- viewDidAppear Event Start --]")
        selectArea()
        print("[-- viewDidAppear Event End --]")
    }
    
    
    /// Description: 照三餐問候，執行順序有問題，暫時移除，稍後修復。
    func helloMessage() {
        self.SiteName.text = "資料取得中"
        self.Status.text = ""
        self.maskHint.text = ""
        
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        if hour >= 6 && hour < 12{
            print(hour)
            self.aqiData.text = "早安"
        } else if hour >= 12 && hour < 18 {
            self.aqiData.text = "午安"
        } else if hour >= 18 && hour < 22{
            self.aqiData.text = "晚上好"
        } else if hour >= 22 || hour < 6 {
            self.aqiData.text = "建議睡覺"
        }
    } // .helloMessage()
    
    
    /// Description: Fetch data, then present it.
    func getAirData() {
        // Alamofire + SwiftyJSON
        let url = "https://opendata.epa.gov.tw/ws/Data/AQI/?$format=json"
        Alamofire.request(url).responseJSON { (response) in
            if response.result.isSuccess {
                
                let json: JSON = JSON(response.result.value!)
                
                self.arrayPlace.removeAll()
                self.arrayAQI.removeAll()
                self.arrayStatus.removeAll()
                self.arrayPM25.removeAll()
                
                /// According to SwiftyJSON documentation, use following for loop when json is .Array
                // _ was "index"
                for (_, subJson):(String, JSON) in json {
                    
                    let SiteName = subJson["SiteName"].string
                    let County = subJson["County"].string
                    let Place = "\(County!) \(SiteName!)"
                    self.arrayPlace.append(Place)
                    
                    let AQI = subJson["AQI"].string
                    self.arrayAQI.append(AQI!)
                    
                    let Status = subJson["Status"].string
                    self.arrayStatus.append(Status!)
                    
                    let PM25 = subJson["PM2.5"].string
                    self.arrayPM25.append(PM25!)
                } // .for loop
                
                self.selectArea()
                
                
            } else if response.result.isFailure {
                
                /// If can't get the data, popup an dialog box.
                let alertController = UIAlertController(
                    title: "ERROR 503",
                    message: "無法取得資料，請稍候在撥。",
                    preferredStyle: .alert)
                let okAction = UIAlertAction(title: "好", style: .default, handler: nil)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
                
            } // .if statement - response
        } // .Alamofire responseJSON
    } // .getAirData()

    func selectArea() {
        let id = UserDefaults.standard.integer(forKey: "mySelect")
        if arrayPlace.count != 1 {
            self.SiteName.text = arrayPlace[id]
            self.aqiData.text = arrayAQI[id]
            self.Status.text = arrayStatus[id]
            self.myUserDefault!.setValue(self.arrayAQI[id], forKey: "aqiDataforWidget")
            
            let aqiData = arrayAQI[id]
            self.masksOrNot(aqiData: aqiData)
        }
    }
    
    func masksOrNot(aqiData: String) {
        print(aqiData)
        let aqiDatas = Int(aqiData)
        if aqiDatas! > 100 {
            self.maskHint.text = "強烈建議戴上口罩"
        } else {
            self.maskHint.text = ""
        }
    }
    
    
    /// Description: Unsplash API, BUT always get the same photo.
    func getUnsplashImageAPI() {
        // let imageAccessKey = "4717907ee1ce3510cb2b8643caddafe1f1dda01933f4bf3391459c7180d2a5f6"
        // let imageSecretkey = "a69849b034ea33aeff1687fccfc0c38b6e23fcc35e5c2fd95bad9b820f85d213"
 
        let unsplashImageAPI = "https://api.unsplash.com/photos/?client_id=4717907ee1ce3510cb2b8643caddafe1f1dda01933f4bf3391459c7180d2a5f6"
        
        Alamofire.request(unsplashImageAPI).responseJSON{ (response) in
            if response.result.isSuccess {
                
                let json: JSON = JSON(response.result.value!)
                let full = json[0]["urls"]["full"].string
                do {
                    let d = URL(string: full!)
                    let dd = try Data(contentsOf: d!)
                    self.unsplashImage.image = UIImage(data: dd)
                } catch {
                    print("I see no error up here, only than me.")
                }
                
            } else if response.result.isFailure {
                
                /// If can't get the data, popup an dialog box, and put placeholder.
                let alertController = UIAlertController(title: "Unsplash 出事了", message: "暫時無法取得圖片，已改用臨時圖片！", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "好", style: .default, handler: nil)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
                self.unsplashImage.image = UIImage(named: "unsplashImage_PlaceHolder")
                
            } // .if statement - response
        } // .Alamofire responseJSON
    } // .getUnsplashImageAPI()
    
    
    /// Description: Unsplash Source, random photo confirmed.
    func getUnsplashImageWeb() {
        do {
            let d = URL(string: "https://source.unsplash.com/random/2732x2048")
            let dd = try Data(contentsOf: d!)
            self.unsplashImage.image = UIImage(data: dd)
        } catch {
            unsplashImage.image = UIImage(named: "unsplashImage_PlaceHolder")
            print("I see no error up here, only than me.")
        }
    }
    
    
    /// Description: A button that can refresh both AQI data and Background photo.
    @IBAction func refresh(_ sender: UIButton) {
        getAirData()
        getUnsplashImageWeb()
    }
    
    
    /// Description: A button that can download background photo.
    @IBAction func downloadPhoto(_ sender: Any) {
        let imageData = UIImagePNGRepresentation(unsplashImage.image!)
        let compresedImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compresedImage!, nil, nil, nil)
    }
    
    
    /// Description: A button that can set where you are. Total time spend on this FUCKING POPOVER: 5hr
    @IBAction func setting(_ sender: Any) {
        self.performSegue(withIdentifier: "goSettingViewController", sender: self)
    } // .setting()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goSettingViewController" {
            
            /// Set arrow position, and send the places info to next view.
            let popover = segue.destination.popoverPresentationController
            popover?.delegate = self
            popover?.sourceRect = CGRect(x: view.frame.width / 6, y: 0, width: 0, height: 0)
            
            let controller = segue.destination as! SettingViewController
            controller.arrayPlace = self.arrayPlace
        } // .segue.identifier
    } // .prepare
    
    
    /// Description: When back from another view, run it.
    @IBAction func unwindSegueBack(Segue: UIStoryboardSegue) {
        selectArea()
    }
    
    
}

