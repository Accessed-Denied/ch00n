//
//  ViewController.swift
//  ch00n
//
//  Created by Rohit Saini on 24/03/20.
//  Copyright © 2020 Accessed Denied. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
        // first commit
    }
    

    @IBAction func playBtnIsPressed(_ sender: UIButton) {
        
        
        let url  = URL.init(string:   "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3")

        let playerItem: AVPlayerItem = AVPlayerItem(url: url!)
        player = AVPlayer(playerItem: playerItem)

        let playerLayer = AVPlayerLayer(player: player!)

        playerLayer.frame = CGRect(x: 0, y: 0, width: 10, height: 50)
        self.view.layer.addSublayer(playerLayer)
        player.play()
    }
    
}

