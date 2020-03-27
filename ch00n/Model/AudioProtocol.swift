//
//  AudioProtocol.swift
//  ch00n
//
//  Created by MACBOOK on 25/03/20.
//  Copyright © 2020 Accessed Denied. All rights reserved.
//

import UIKit
import AVFoundation

enum AudioStatus: String{
    case play
    case pause
    case stop
}

protocol AudioProtocolDelegate: class {
    func didAudioStatusReceived(status: AudioStatus)
}
