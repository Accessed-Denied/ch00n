//
//  RegisterVC.swift
//  ch00n
//
//  Created by MACBOOK on 05/04/20.
//  Copyright © 2020 Accessed Denied. All rights reserved.
//

import UIKit
import SainiUtils

class RegisterVC: UIViewController {
    
    var position = ["latitude": 30,"longitude":70]

    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var mobileNumberTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        ConfigUI()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - ConfigUI
    private func ConfigUI() {
        LoginViewGesture()
        registerBtn.layer.cornerRadius = registerBtn.frame.height / 2
    }
    
    private func LoginViewGesture() {
        loginView.sainiAddTapGesture {
            let vc = STORYBOARD.MAIN.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    //MARK: - registerBtnIsPressed
    @IBAction func registerBtnIsPressed(_ sender: UIButton) {
        User.registerUser(withName: nameTextfield.text!, email: emailTextfield.text!, password: passwordTextfield.text!, phoneNumber: mobileNumberTextfield.text!, profilePic: profileImage.image!, location: position) { (Loginhandler) in
            if Loginhandler == nil{
                let Login = STORYBOARD.MAIN.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
                let alert = UIAlertController(title: "Verification", message: "A verification mail has been sent to your registered mail id please verify the email.", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (result) in
                    self.navigationController?.pushViewController(Login, animated: true)

                }))

                self.present(alert, animated: true, completion: nil)

            }else{
                showAlertwithTitle(title: "Error", desc: Loginhandler!, vc: self)
            }
        }
    }
    

}
