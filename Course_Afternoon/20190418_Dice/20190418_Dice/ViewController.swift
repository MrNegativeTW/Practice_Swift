//
//  ViewController.swift
//  20190418_Dice
//
//  Created by Trevor Wu on 2019/4/18.
//  Copyright © 2019年 TxWStudio. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    @IBOutlet weak var leftDiceImage: UIImageView!
    @IBOutlet weak var rightDiceImage: UIImageView!
    @IBOutlet weak var bigOrSmallButton: UIButton!
    @IBOutlet weak var myGifView: UIImageView!

    var totalPoint = ""
    
    var diceIndex1: Int = 0
    var diceIndex2: Int = 0
    
    let diceImageArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myGifView.loadGif(name: "diceRollingGIF")
        
        // Simply random order when open app.
        /*
        diceIndex1 = Int(arc4random_uniform(UInt32(6)))
        leftDiceImage.image = UIImage(named: diceImageArray[diceIndex1])
        diceIndex2 = Int(arc4random_uniform(UInt32(6)))
        rightDiceImage.image = UIImage(named: diceImageArray[diceIndex2])
        */
    }
    
    override func viewDidAppear(_ animated: Bool) {
        myGifView.loadGif(name: "diceRollingGIF")
        leftDiceImage.image = UIImage(named: "")
        rightDiceImage.image = UIImage(named: "")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as!
        ViewController2
        
        // Your choice, big or small
        controller.bigOrSmall = bigOrSmallButton.currentTitle
        // Total point get
        controller.totalPoint = totalPoint
    }
    
    var player: AVAudioPlayer?
    
    @IBAction func rollDice(_ sender: Any) {
        diceIndex1 = Int(arc4random_uniform(UInt32(6)))
        leftDiceImage.image = UIImage(named: diceImageArray[diceIndex1])
        diceIndex2 = Int(arc4random_uniform(UInt32(6)))
        rightDiceImage.image = UIImage(named: diceImageArray[diceIndex2])
        myGifView.image = UIImage(named: "")
        
        guard let url = Bundle.main.url(forResource: "diceRollSound", withExtension: "wav") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        // passing data to ViewController2
        let totalPoints = diceIndex1 + diceIndex2 + 2
        self.totalPoint = String(totalPoints)
        performSegue(withIdentifier: "goScore", sender: self)
    }
    
    
    @IBAction func bigOrSmallBet(_ sender: Any) {
        if bigOrSmallButton.currentTitle == "押大" {
            bigOrSmallButton.setTitle("押小", for: .normal)
        } else if bigOrSmallButton.currentTitle == "押小" {
            bigOrSmallButton.setTitle("押大", for: .normal)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

