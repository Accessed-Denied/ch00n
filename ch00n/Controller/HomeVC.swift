//
//  ViewController.swift
//  ch00n
//
//  Created by Rohit Saini on 24/03/20.
//  Copyright © 2020 Accessed Denied. All rights reserved.
//

import UIKit
import AVFoundation

class HomeVC: UIViewController {

    weak var delegate: AudioProtocolDelegate?
    var audioDownloader: AudioDownloader?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func playBtnIsPressed(_ sender: UIButton) {
        PlayAudio()
    }
    
}

extension HomeVC: AudioProtocolDelegate {
    func PlayAudio() {
        self.audioDownloader?.PlayAudio(url: AudioURL.url)
    }
    
    
}

