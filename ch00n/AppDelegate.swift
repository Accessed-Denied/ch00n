//
//  AppDelegate.swift
//  ch00n
//
//  Created by Rohit Saini on 24/03/20.
//  Copyright © 2020 Accessed Denied. All rights reserved.
//

import NVActivityIndicatorView
import UIKit
import Firebase
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var activityLoader : NVActivityIndicatorView!
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        FirebaseApp.configure()
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldShowToolbarPlaceholder = true
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    //MARK:- Show Loader
    func showLoader()
    {
        removeLoader()
        window?.isUserInteractionEnabled = false
        activityLoader = NVActivityIndicatorView(frame: CGRect(x: ((window?.frame.size.width)!-100)/2, y: ((window?.frame.size.height)!-100)/2, width: 100, height: 100))
        activityLoader.type = .ballClipRotatePulse
        activityLoader.color = UIColor.white
        window?.addSubview(activityLoader)
        activityLoader.startAnimating()
    }
    
    //MARK:- Remove Loader
    func removeLoader()
    {
        
        window?.isUserInteractionEnabled = true
        if activityLoader == nil
        {
            return
        }
        activityLoader.stopAnimating()
        activityLoader.removeFromSuperview()
        activityLoader = nil
    }
    
    //MARK:- sharedDelegate
    func sharedDelegate() -> AppDelegate
    {
        return UIApplication.shared.delegate as! AppDelegate
    }

}

