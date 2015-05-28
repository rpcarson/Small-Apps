//
//  LoginViewController.swift
//  ParseLogin
//
//  Created by Reed Carson on 5/28/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    
   
    
    
    
    
    @IBOutlet weak var LoginVisual: UIButton!
    
    @IBOutlet weak var UserField: UITextField!
    
    @IBOutlet weak var PasswordField: UITextField!
    
    
    
    
    
    @IBAction func LoginButton(sender: AnyObject) {
    
    
    login()
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red:0.45, green:0.35, blue:0.74, alpha:1)
        LoginVisual.backgroundColor = UIColor(red:1, green:0.76, blue:0.21, alpha:1)
        
        LoginVisual.layer.cornerRadius = 10
        
        
    }
    
    func login() {
        
        PFUser.logInWithUsernameInBackground(UserField.text, password: PasswordField.text) {
            
            (user: PFUser?, error: NSError?) -> Void in
            
            if user != nil {
                
                self.performSegueWithIdentifier("cancelLogin", sender: nil)
               
         
                
                
                println("\(user!.username) logged in")
                
            }else{
                
                println("Error Logging in LoL")
                
            }
        }
        
        
    }
    
    
    
}


