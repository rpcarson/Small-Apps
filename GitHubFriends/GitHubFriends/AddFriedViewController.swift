//
//  AddFriedViewController.swift
//  GitHubFriends
//
//  Created by Reed Carson on 5/13/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit

class AddFriedViewController: UIViewController
{

  
    @IBAction func cancel(sender: AnyObject) {
    
        dismissViewControllerAnimated(true, completion: nil)
    
    
    
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
