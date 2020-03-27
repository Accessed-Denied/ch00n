//
//  Utility.swift
//  ch00n
//
//  Created by MACBOOK on 25/03/20.
//  Copyright © 2020 Accessed Denied. All rights reserved.
//

import UIKit
import AVFoundation

struct AudioURL {
    static let url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"
}


class AudioDownloader {
    
    func PlayAudio(url: String) {
        
        
        let player: AVPlayer?
        let url = URL.init(string: url)

        let playerItem: AVPlayerItem = AVPlayerItem(url: url!)
        player = AVPlayer(playerItem: playerItem)

        let playerLayer = AVPlayerLayer(player: player!)

        playerLayer.frame = CGRect(x: 0, y: 0, width: 10, height: 50)
//        self.view.layer.addSublayer(playerLayer)
        player?.play()
    }
}

