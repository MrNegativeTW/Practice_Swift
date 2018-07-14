//
//  ViewController.swift
//  wowmuchdoge
//
//  Created by Trevor Wu on 2018/5/23.
//  Copyright © 2018年 Trevor Wu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var powerButton: UIButton!
    @IBOutlet weak var CloudHolder: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var pinch: UILabel!
    @IBOutlet weak var soft: UILabel!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            
        }catch let error as NSError {
            print(error.description)
        }
    }
    
    @IBAction func powerButton(_ sender: Any) {
        CloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerButton.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 150,width: 375,height: 402)
        }) { (finished) in
            self.pinch.isHidden = false
            self.soft.isHidden = false
        }
    }
    
    
    
}

