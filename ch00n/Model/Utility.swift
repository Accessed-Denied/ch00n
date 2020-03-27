//
//  Utility.swift
//  ch00n
//
//  Created by MACBOOK on 25/03/20.
//  Copyright © 2020 Accessed Denied. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

struct AudioURL {
    static let url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"
}


class AudioDownloader {
    
    func PlayAudio(vc: UIViewController) {
        let player = AVPlayer(url: URL(string: AudioURL.url)!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        vc.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
    }
    
}

