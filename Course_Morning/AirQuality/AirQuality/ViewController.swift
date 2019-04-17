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
        
        getAirData()
        getUnsplashImage()
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
        
        var aqiArray :[AQI]?
        
        struct AQI: Codable{
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

                // 透過decoder 將自定義型別帶入，讓 decoder 自動把資料配對進型別中
                if let data = data , let result = try? decoder.decode([AQI].self, from: data) {
                    
                    // 取完資料後將結果放進 array
                    aqiArray = result
                    print(aqiArray![0].AQI!)
                    
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

    
    func getUnsplashImage() {
        let imageAccessKey = "4717907ee1ce3510cb2b8643caddafe1f1dda01933f4bf3391459c7180d2a5f6"
        let imageSecretkey = "a69849b034ea33aeff1687fccfc0c38b6e23fcc35e5c2fd95bad9b820f85d213"
        
    }
    
    
    func getJson() {
        
        /*struct User {
            var userId: Int
            var id: Int
            var title: String
            var completed: Bool
            init(_ dictionary: [String: Any]) {
                self.userId = dictionary["userId"] as? Int ?? 0
                self.id = dictionary["id"] as? Int ?? 0
                self.title = dictionary["title"] as? String ?? ""
                self.completed = dictionary["completed"] as? Bool ?? false
            }
        }*/
        
        struct User: Codable{
            var userId: Int
            var id: Int
            var title: String
            var completed: Bool
        }
        
        
        
//        guard let url = URL(string: "https://opendata.epa.gov.tw/ws/Data/AQI/?format=json") else {return}
//        guard let url = URL(string: "https://opendata.epa.gov.tw/ws/Data/AQI/?format=json") else {return}
//        guard let url = URL(string: "https://opendata.epa.gov.tw/ws/Data/AQI/?format=json") else {return}
//        guard let url = URL(string: "http://opendata.epa.gov.tw/webapi/Data/REWIQA/?$orderby=SiteName&$skip=0&$top=1000&format=json") else {return}
//      guard let url = URL(string: "https://opendata.epa.gov.tw/ws/Data/AQI/?format=json") else {return}
      guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data, error == nil else {
                print(error?.localizedDescription ?? "Response Error")
                return
            }
            do{
                // here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: [])
                //print(jsonResponse) //Response result
                
                guard let jsonArray = jsonResponse as? [[String: Any]] else {
                    return
                }
                //print(jsonArray) // Print whole array
                
                //Now get title value
                guard let title = jsonArray[0]["title"] as? String else { return }
                self.aqiData.text = title
                print(title) // Print "delectus aut autem"
                
                for dic in jsonArray{
                    guard let title = dic["title"] as? String else { return }
                    print(title) //Output
                }
                
                
                
                
            } catch let parsingError {
                print("Error", parsingError)
            }
            
            
        }
        task.resume()
    }
    
    
    
    
    @IBAction func refresh(_ sender: UIButton) {
        getAirData()
        getUnsplashImage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

