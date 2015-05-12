//
//  ListTableViewCell.swift
//  HighPriority
//
//  Created by Reed Carson on 5/11/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit



let priorityColors = [

UIColor(red:0.99, green:0.2, blue:0.24, alpha:1),
UIColor(red:0.99, green:0.46, blue:0.32, alpha:1),
UIColor(red:0.99, green:0.68, blue:0.42, alpha:1),

]






class ListTableViewCell: UITableViewCell {

    
    
    
    
    
    
    
    
    
    @IBOutlet weak var itemLabel: UILabel!
    
    @IBOutlet weak var itemStrikeThrough: UIView!
    
    var itemInfo: [String:AnyObject]! {
        
        
        didSet {
            
            itemLabel.text = itemInfo["name"] as? String
            itemStrikeThrough.hidden = !(itemInfo["completed"] as! Bool)
            
            backgroundColor = priorityColors[itemInfo["priority"] as! Int]
        }
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        itemInfo["completed"] = !(itemInfo["completed"] as! Bool)
        
        
        if itemInfo["completed"] as! Bool {
            
            itemStrikeThrough.hidden = false
            backgroundColor = UIColor(red:0.32, green:0.32, blue:0.32, alpha:1)
            
        } else {
            
            itemStrikeThrough.hidden = true
            backgroundColor = priorityColors[itemInfo["priority"] as! Int]

            
        }

    
    
}
}