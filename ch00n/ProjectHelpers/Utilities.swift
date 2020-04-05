//
//  Utilities.swift
//  ch00n
//
//  Created by MACBOOK on 06/04/20.
//  Copyright © 2020 Accessed Denied. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

//MARK: - AudioURL
struct AudioURL {
    static let url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"
}

//MARK: - AudioDownloader
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

//MARK:- showLoader
func showLoader()
{
    AppDelegate().sharedDelegate().showLoader()
}
//MARK:- removeLoader
func removeLoader()
{
    AppDelegate().sharedDelegate().removeLoader()
}

//Image Compression to 10th
func compressImage(image: UIImage) -> Data {
    // Reducing file size to a 10th
    
    var actualHeight : CGFloat = image.size.height
    var actualWidth : CGFloat = image.size.width
    let maxHeight : CGFloat = 1920.0
    let maxWidth : CGFloat = 1080.0
    var imgRatio : CGFloat = actualWidth/actualHeight
    let maxRatio : CGFloat = maxWidth/maxHeight
    var compressionQuality : CGFloat = 0.5
    
    if (actualHeight > maxHeight || actualWidth > maxWidth) {
        
        if (imgRatio < maxRatio) {
            
            //adjust width according to maxHeight
            imgRatio = maxHeight / actualHeight;
            actualWidth = imgRatio * actualWidth;
            actualHeight = maxHeight;
        } else if (imgRatio > maxRatio) {
            
            //adjust height according to maxWidth
            imgRatio = maxWidth / actualWidth;
            actualHeight = imgRatio * actualHeight;
            actualWidth = maxWidth;
            
        } else {
            
            actualHeight = maxHeight
            actualWidth = maxWidth
            compressionQuality = 1
        }
    }
    
    let rect = CGRect(x: 0.0, y: 0.0, width:actualWidth, height:actualHeight)
    UIGraphicsBeginImageContext(rect.size)
    image.draw(in: rect)
    let img = UIGraphicsGetImageFromCurrentImageContext()
    let imageData = img!.jpegData(compressionQuality: compressionQuality)
    UIGraphicsEndImageContext();
    
    return imageData!
}

//MARK: - showAlertWithTitle
func showAlertwithTitle(title:String , desc:String , vc:UIViewController)  {
    let alert = UIAlertController(title: title, message: desc, preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
    vc.present(alert, animated: true, completion: nil)
}
