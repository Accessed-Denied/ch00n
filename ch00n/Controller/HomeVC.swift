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

    private var homeVM: HomeViewModel = HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        homeVM.audioDelegate = self


        // Do any additional setup after loading the view.
    }
    
    @IBAction func playBtnIsPressed(_ sender: UIButton) {
        homeVM.playSound(vc: self)
    }
    
}

extension HomeVC: AudioProtocolDelegate{
    func didAudioStatusReceived(status: AudioStatus) {
        print(status)
    }
}



