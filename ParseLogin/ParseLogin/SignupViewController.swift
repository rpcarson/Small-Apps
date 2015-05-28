//
//  SignupViewController.swift
//  ParseLogin
//
//  Created by Reed Carson on 5/28/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit
import Parse


class SignupViewController: UIViewController {
    
    
    
    @IBAction func SignMeUpButton(sender: UIButton) {
        
        signMeUp()
        
    }
    
    
    @IBOutlet weak var SignUp: UIButton!
    
    @IBOutlet weak var UsernameField: UITextField!
    
    @IBOutlet weak var EmailField: UITextField!
    
    @IBOutlet weak var PasswordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red:1, green:0.76, blue:0.21, alpha:1)
        
        SignUp.layer.cornerRadius = 10
        
        SignUp.backgroundColor = UIColor(red:0.91, green:0.3, blue:0.27, alpha:1)
        
    }
    
    
    func signMeUp() {
        
        var user = PFUser()
        
        user.username = UsernameField.text
        user.password = PasswordField.text
        user.email = EmailField.text
        
        user.signUpInBackgroundWithBlock {
            
            (succeded: Bool, error: NSError?) -> Void in
            
            if let error = error {
                
                let errorString = error.userInfo?["error"] as? NSString
                
            }else{
                
                self.performSegueWithIdentifier("cancelSignup", sender: nil)
                
                println(user.username)
            }
        }
    }
}



