//
//  ListTableViewCell.swift
//  HighPriority
//
//  Created by Reed Carson on 5/11/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit



let priorityColors = [

UIColor.redColor(),
UIColor.orangeColor(),
UIColor.yellowColor(),

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
            backgroundColor = UIColor.lightGrayColor()

            
        } else {
            
            itemStrikeThrough.hidden = true
            backgroundColor = priorityColors[itemInfo["priority"] as! Int]

            
        }

    
    
}
}