//
//  ViewController.swift
//  AirQuality
//
//  Created by Trevor Wu on 2019/4/17.
//  Copyright © 2019年 TxWStudio. All rights reserved.
//
// TODO:
// - Switch to MVVM, No more MVC(Massive View Controller)
// - popover arrow position
// - Today extension update
// - passing data from tableview on select
// - Fix Navigation bar, on top
//
// Done:
// - passing data to tableview
//
// Documentation? Not today.

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    // Declear UserDefault
    let myUserDefault = UserDefaults(suiteName: "group.com.txwstudio.trevorwu.AirQuality")
    
    @IBOutlet weak var unsplashImage: UIImageView!
    @IBOutlet weak var SiteName: UILabel!
    @IBOutlet weak var aqiData: UILabel!
    @IBOutlet weak var Status: UILabel!
    
    var arrayPlace = ["0"]
    var arrayAQI = ["0"]
    var arrayStatus = ["0"]
    var arrayPM25 = ["0"]
    var arrayUnsplashImage = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("[----- viewDidLoad Event Start -----]")
        helloMessage()
        getAirData()
//        getUnsplashImage()
        getUnsplashImageTest()
        print("[----- viewDidLoad Event End -----]")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // for iPhone
        print("[----- viewDidAppear Event Start -----]")
        selectArea()
        print("[----- viewDidAppear Event End -----]")
    }
    
    func helloMessage() {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        if hour < 12 || hour == 0 {
            print(hour)
            self.aqiData.text = "早"
        }
    }
    
    
    func getAirData() {
        // Alamofire + SwiftyJSON
        print("[----- Running getAirData() -----]")
        let url = "https://opendata.epa.gov.tw/ws/Data/AQI/?$format=json"
        Alamofire.request(url).responseJSON { (response) in
            if response.result.isSuccess {
                
                let json: JSON = JSON(response.result.value!)
                
                self.arrayPlace.removeAll()
                self.arrayAQI.removeAll()
                self.arrayStatus.removeAll()
                self.arrayPM25.removeAll()
                
                // According to SwiftyJSON documentation, use following for loop when json is .Array
                // _ was "index"
                for (_, subJson):(String, JSON) in json {
                    
                    let SiteName = subJson["SiteName"].string
                    let County = subJson["County"].string
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
                
                if mySelect != 0 {
                    self.SiteName.text = self.arrayPlace[mySelect]
                    self.aqiData.text = self.arrayAQI[mySelect]
                    self.Status.text = self.arrayStatus[mySelect]
                    self.myUserDefault!.setValue(self.arrayAQI[mySelect], forKey: "aqiDataforWidget")
                } else {
                    self.SiteName.text = self.arrayPlace[0]
                    self.aqiData.text = self.arrayAQI[0]
                    self.Status.text = self.arrayStatus[0]
                    self.myUserDefault!.setValue(self.arrayAQI[0], forKey: "aqiDataforWidget")
                }
                
                
                
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
        print("[----- Finishing getAirData() -----]")
    } // .getAirDataTest()

    
    func getUnsplashImage() {
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
    } // .getUnsplashImageTest1()
    
    
    func getUnsplashImageTest() {
        print("[----- Running getUnsplashImageTest() -----]")
        // Temporary Solution
        do {
            let d = URL(string: "https://source.unsplash.com/random/2732x2048")
            let dd = try Data(contentsOf: d!)
            self.unsplashImage.image = UIImage(data: dd)
        } catch {
            print("error")
        }
        print("[----- Finishing getUnsplashImageTest() -----]")
    } // .getUnsplashImageTest()
    
    
    @IBAction func refresh(_ sender: UIButton) {
        print("[----- You just hit refresh -----]")
        getAirData()
        // getUnsplashImage()
        getUnsplashImageTest()
    } // .refresh()
    
    
    @IBAction func downloadPhoto(_ sender: Any) {
        let imageData = UIImagePNGRepresentation(unsplashImage.image!)
        let compresedImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compresedImage!, nil, nil, nil)
        print("[----- Photo just downloaded -----]")
    } // .downloadPhoto()
    
    
    // Total time spend on this FUCKING POPOVER: 5hr
    @IBAction func setting(_ sender: Any) {
        self.performSegue(withIdentifier: "goSettingViewController", sender: self)
    } // .setting()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goSettingViewController" {
            let popover = segue.destination.popoverPresentationController
            popover?.delegate = self
            popover?.sourceRect = CGRect(x: view.frame.width / 6, y: 0, width: 0, height: 0)
            
            let controller = segue.destination as! SettingViewController
            controller.arrayPlace = self.arrayPlace
        } // .segue.identifier
    } // .prepare
    
    
    @IBAction func unwindSegueBack(Segue: UIStoryboardSegue) {
        print("[----- Running unwindSegueBack -----]")
        selectArea()
        print("[----- Finishing unwindSegueBack -----]")
    }
    
    
    
    func selectArea() {
        print("[------- Running selectArea -------]")
        self.SiteName.text = arrayPlace[mySelect]
        self.aqiData.text = arrayAQI[mySelect]
        self.Status.text = arrayStatus[mySelect]
        self.myUserDefault!.setValue(self.arrayAQI[mySelect], forKey: "aqiDataforWidget")
        self.myUserDefault!.setValue(mySelect, forKey: "mySelect")
        print("[------- Finishing selectArea -------]")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

