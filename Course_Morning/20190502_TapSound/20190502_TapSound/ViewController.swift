//
//  ViewController.swift
//  20190502_TapSound
//
//  Created by student on 2019/5/2.
//  Copyright © 2019年 student. All rights reserved.
//
// Device: iPhone 8 Plus
// Swift: 4

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var player: AVAudioPlayer?
    
    @IBAction func Tap(_ sender: UIButton) {
        
        print(sender.tag)
        
        guard let url = Bundle.main.url(forResource: "Sound\(sender.tag)", withExtension: "wav") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            
            guard let player = player else { return }
            
            player.play()
            
        } catch {
            print("It crashed. I have no idea, maybe is your iDevice too old, go get a new one.")
        }
        
    }
    
}

