//
//  FriendTableViewCell.swift
//  GitHubFriends
//
//  Created by Reed Carson on 5/13/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    
    

    
    
    
    
    
    
    var friendIndex: Int!
    var friendInfo: [String:AnyObject?]! {
        
        didSet {
            
            
            reposButton.tag = friendIndex
            gistsButton.tag = friendIndex
            
            friendNameLabel.text = friendInfo["name"] as? String
            let repoCount = friendInfo("public_repos") as! Int
                reposButton.setTitle("Repos\(repoCount)", forState .Normal)
            
            
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

}
