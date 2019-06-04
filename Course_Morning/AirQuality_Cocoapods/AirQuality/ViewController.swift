//
//  ViewController.swift
//  AirQuality
//
//  Created by Trevor Wu on 2019/4/17.
//  Copyright © 2019年 TxWStudio. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class ViewController: UIViewController {
    
    // Declear UserDefault
    let myUserDefault = UserDefaults(suiteName: "group.com.txwstudio.trevorwu.AirQuality")
    
    @IBOutlet weak var unsplashImage: UIImageView!
    @IBOutlet weak var SiteName: UILabel!
    @IBOutlet weak var aqiData: UILabel!
    @IBOutlet weak var Status: UILabel!
    
    var arrayPlace = [String]()
    var arrayAQI = [String]()
    var arrayStatus = [String]()
    var arrayPM25 = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        helloMessage()
        getAirData()
        getAirDataTest()
//        getUnsplashImageTest1()
        getUnsplashImageTest2()
    }
    
    func helloMessage() {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        if hour < 12 || hour == 0 {
        print(hour)
        DispatchQueue.main.async {
            self.aqiData.text = "早"
            }
        }
    }
    
    
    func getAirDataTest() {
        // Alamofire + SwiftyJSON
        let url = "https://opendata.epa.gov.tw/ws/Data/AQI/?$format=json"
        Alamofire.request(url).responseJSON { (response) in
            if response.result.isSuccess {
                
                let json: JSON = JSON(response.result.value!)
                
                // According to SwiftyJSON documentation, use following for loop when json is .Array
                for (index, subJson):(String, JSON) in json {
                    
                    let SiteName = subJson["SiteName"].string
                    //print(SiteName!)
                    
                    let County = subJson["County"].string
                    //print(Country!)
                    
                    let Place = "\(County!) \(SiteName!)"
                    //print(Place)
                    self.arrayPlace.append(Place)
                    
                    let AQI = subJson["AQI"].string
                    //print(AQI!)
                    self.arrayAQI.append(AQI!)
                    
                    let Status = subJson["Status"].string
                    //print(Status!)
                    self.arrayStatus.append(Status!)
                    
                    let PM25 = subJson["PM2.5"].string
                    //print(PM25!)
                    self.arrayPM25.append(PM25!)
                } // .for loop
                
//                print(self.arrayPlace)
//                print(self.arrayAQI)
//                print(self.arrayStatus)
//                print(self.arrayPM25)
                
            } else if response.result.isFailure {
                
                // If can't get the data, popup an dialog box.
                let alertController = UIAlertController(title: "Oh man...", message: "Something shit happened, we can't get that data for now, please come back later.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Damn", style: .default, handler: nil)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
                
            } // .response
            
        } // .Alamofire responseJSON
        
    } // .getAirDataTest
    
    
    func getAirData() {
        // 切換到 Main Thread
        DispatchQueue.main.async {
            // 未取得資料前文字
            self.SiteName.text = "正在取得..."
            self.aqiData.text = "空品資料取得中..."
            self.Status.text = ""
        }
        
        let AQI_URL = "https://opendata.epa.gov.tw/ws/Data/AQI/?$format=json".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        var aqiArray: [AQI]?
        
        struct AQI: Codable {
            let SiteName: String?
            let County: String?
            let AQI: String?
            let Status: String?
            let PublishTime: String?
        }
        
        if let url = URL(string: AQI_URL!) {
            let task = URLSession.shared.dataTask(with: url)
            {(data, response, error) in

                // 透過 JSONDecoder 解 API 資訊
                let decoder = JSONDecoder()

                // 透過 decoder 將自定義型別帶入，讓 decoder 自動把資料配對進型別中
                if let data = data, let result = try? decoder.decode([AQI].self, from: data) {
                    
                    // 取完資料後將結果放進 array
                    aqiArray = result
                    print("AQI: " + aqiArray![0].AQI!)
                    
                    // 切換到 Main Thread
                    DispatchQueue.main.async {
                        self.SiteName.text = aqiArray![0].SiteName!
                        self.aqiData.text = aqiArray![0].AQI!
                        self.Status.text = aqiArray![0].Status!
                        self.myUserDefault!.setValue(aqiArray![0].AQI!, forKey: "aqiDataforWidget")
                    }
                }
            } // .task
            task.resume()
        } // .URL
    } // .getAirData

    
    func getUnsplashImageTest1() {
        // Long Term Solution
        let imageAccessKey = "4717907ee1ce3510cb2b8643caddafe1f1dda01933f4bf3391459c7180d2a5f6"
        let imageSecretkey = "a69849b034ea33aeff1687fccfc0c38b6e23fcc35e5c2fd95bad9b820f85d213"
        
        let unsplashImageAPI = "https://api.unsplash.com/photos/?client_id=4717907ee1ce3510cb2b8643caddafe1f1dda01933f4bf3391459c7180d2a5f6".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        var imageArray: [image]?
        
        struct image: Codable {
            let urls: URLS?
        }
        enum URLS: String, Codable { case raw, full, regular, small, thumb }
        
        if let url = URL(string: unsplashImageAPI!) {
            let task = URLSession.shared.dataTask(with: url) {
                (data, response, error) in
                
                // 透過 JSONDecoder 解 API 資訊
                let decoder = JSONDecoder()
                
                // 透過 decoder 將自定義型別帶入，讓 decoder 自動把資料配對進型別中
                if let data = data, let result = try? decoder.decode([image].self, from: data) {
                    
                    // 取完資料後將結果放進 array
                    imageArray = result
                    print(imageArray![0].urls!)
                    print("i got here")
                    
                    // 切換到 Main Thread
                    DispatchQueue.main.async {
                        //self.SiteName.text = imageArray![0].SiteName!
                    }
                }
            }
            task.resume()
        }
        unsplashImage.image = UIImage(named: "unsplashImage_PlaceHolder")
    }
    
    
    func getUnsplashImageTest2() {
        // Temporary Solution
        do {
            let d = URL(string: "https://source.unsplash.com/random")
            let dd = try Data(contentsOf: d!)
            self.unsplashImage.image = UIImage(data: dd)
        } catch {
            print("error")
        }
    }
    
    
    @IBAction func refresh(_ sender: UIButton) {
        getAirData()
//        getUnsplashImageTest1()
        getUnsplashImageTest2()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

