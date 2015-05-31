//
//  SomeButtonsViewController.swift
//  AlbumArt
//
//  Created by Reed Carson on 5/31/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit
import AFNetworking

public var artistSearch = String?()

class SomeButtonsViewController: UIViewController {
    
    
    
    
    
  
//    public var artistInput = searchField.text

    
    
    @IBOutlet weak var searchField: UITextField!
    
    @IBAction func searchArtistButton(sender: UIButton) {

       println("uhoh")
    
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        artistSearch = searchField.text 

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
