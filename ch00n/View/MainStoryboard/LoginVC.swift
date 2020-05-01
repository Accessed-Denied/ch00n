//
//  LoginVC.swift
//  ch00n
//
//  Created by MACBOOK on 06/04/20.
//  Copyright © 2020 Accessed Denied. All rights reserved.
//

import UIKit
import CoreLocation

class LoginVC: UIViewController {
    
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ConfigUI()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - ConfigUI
    private func ConfigUI() {
        loginBtn.layer.cornerRadius = loginBtn.frame.height / 2
        
//        locationManager.requestWhenInUseAuthorization()
//        var currentLoc: CLLocation!
//        if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
//        CLLocationManager.authorizationStatus() == .authorizedAlways) {
//           currentLoc = locationManager.location
////            print(currentLoc.coordinate.latitude)
////           print(currentLoc.coordinate.longitude)
//        }
    }
    
    //MARK: - loginBtnIsPressed
    @IBAction func loginBtnIsPressed(_ sender: UIButton) {
        
        let email = emailTextfield.text ?? ""
        let password = passwordTextfield.text ?? ""
        User.loginUser(email: email, password: password) { (Loginhandler) in
            if Loginhandler == nil{
                print("Logged in")
                AppDelegate().sharedDelegate().navigateToDashboard()
            }else{
                showAlertwithTitle(title: "Error", desc: Loginhandler!, vc: self)
            }
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
