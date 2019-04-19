//
//  ViewController.swift
//  AirQuality
//
//  Created by Trevor Wu on 2019/4/17.
//  Copyright © 2019年 TxWStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var unsplashImage: UIImageView!
    @IBOutlet weak var SiteName: UILabel!
    @IBOutlet weak var aqiData: UILabel!
    @IBOutlet weak var Status: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        helloMessage()
        getAirData()
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
                    }
                }
            }
            task.resume()
        }
    }

    
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

