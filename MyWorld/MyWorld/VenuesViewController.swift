//
//  VenuesViewController.swift
//  MyWorld
//
//  Created by Reed Carson on 5/22/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit

class VenuesViewController: UIViewController {

    
   @IBOutlet weak var categoriesLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        addressLabel.text = addressInfo
        categoriesLabel.text = categoryName
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}
