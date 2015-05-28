//
//  ViewController.swift
//  ParseLogin
//
//  Created by Reed Carson on 5/28/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit
import Parse




class ViewController: UIViewController {
    
    
    
    @IBAction func LogoutUser(sender: UIButton) {
  
        var currentUser = PFUser.currentUser()
        PFUser.logOut()
        
        if currentUser == nil {
            
            SignupButton1.hidden = false
            LoginButton1.hidden = false
            Logout.hidden = true
        }
        

    
    
    }
    
    
    @IBOutlet weak var Logout: UIButton!
    

    @IBOutlet weak var SignupButton1: UIButton!

    @IBOutlet weak var LoginButton1: UIButton!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    SignupButton1.backgroundColor = UIColor(red:0.16, green:0.4, blue:0.64, alpha:1)
        
    LoginButton1.backgroundColor = UIColor(red:0.16, green:0.4, blue:0.64, alpha:1)
        
        SignupButton1.layer.cornerRadius = 10
        LoginButton1.layer.cornerRadius = 10
    
    Logout.hidden = true
    
    }
    
    override func viewWillAppear(animated: Bool) {
        
        if PFUser.currentUser() != nil {
            
            SignupButton1.hidden = true
            LoginButton1.hidden = true
            
            Logout.hidden = false
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

