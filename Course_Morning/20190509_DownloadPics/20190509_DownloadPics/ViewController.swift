//
//  ViewController.swift
//  20190509_DownloadPics
//
//  Created by student on 2019/5/9.
//  Copyright © 2019年 TxWStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var unsplashImage: UIImageView!
    @IBOutlet weak var download: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        getUnsplashImage()
        getUnsplashImage2()
    }
    
    func getUnsplashImage() {
        do {
            let imageSource = URL(string: "https://source.unsplash.com/random")
            let imageData = try Data(contentsOf: imageSource!)
            self.unsplashImage.image = UIImage(data: imageData)
        } catch {
            print("Runtime Error.")
        }
    }
    
//    func getUnsplashImage2() {
//        let imageSource = URL(string: "https://source.unsplash.com/random")
//        let imageData = URLRequest(url: imageSource!)
//        let task = URLSession.shared.dataTask(with: imageData) { (data, response, error) in
//            if error != nil {
//                print("wow")
//            } else {
//                if let ImageData = data {
//
//                    DispatchQueue.main.async {
//                        self.unsplashImage.image = UIImage(data: ImageData)
//                    }
//
//                    // Download and Save Pictures
//                    let docPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
//                    // print(docPath)
//                    if docPath.count > 0 {
//                        let savePath = docPath[0] + "/unsplash.jpg"
//                        let imageforSave = UIImage(data: ImageData)
//
//
//                    }
//
//                }
//
//            }
//
//        }
//
//
//
//        } // .task
//        task.resume()
//
//
//    }
//
//}


}
