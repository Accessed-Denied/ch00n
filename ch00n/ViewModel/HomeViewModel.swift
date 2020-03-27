//
//  HomeViewModel.swift
//  ch00n
//
//  Created by Rohit Saini on 27/03/20.
//  Copyright © 2020 Accessed Denied. All rights reserved.
//

import Foundation
import UIKit

struct HomeViewModel{
    var audioDelegate: AudioProtocolDelegate?
    func playSound(vc: UIViewController){
        AudioDownloader().PlayAudio(vc: vc)
        audioDelegate?.didAudioStatusReceived(status: .play)
    }
}
