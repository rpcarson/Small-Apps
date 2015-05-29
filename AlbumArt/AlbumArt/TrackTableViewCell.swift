//
//  TrackTableViewCell.swift
//  AlbumArt
//
//  Created by Reed Carson on 5/29/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit

protocol TrackTableViewCellDelegate {
    
    func playSongWithURL(url: String)
    
}

class TrackTableViewCell: UITableViewCell {
    
    var delegate: TrackTableViewCellDelegate?
    
    var trackInfo: [String:AnyObject]! {
        
        didSet {
            
            trackName.text = trackInfo["trackName"] as? String
            
        }
        
    }
    
    
    @IBOutlet weak var trackName: UILabel!
    
    @IBAction func toggleSong(sender: UIButton) {
    
    
        
        if let url = trackInfo["previewUrl"] as? String {
        
        delegate?.playSongWithURL(url)
    
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
