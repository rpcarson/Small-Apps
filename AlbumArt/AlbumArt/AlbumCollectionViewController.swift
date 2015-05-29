//
//  AlbumCollectionViewController.swift
//  AlbumArt
//
//  Created by Reed Carson on 5/29/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit
//import DatShit
import AFNetworking

let reuseIdentifier = "albumCell"

class AlbumCollectionViewController: UICollectionViewController {
    
    var albums: [[String:AnyObject]] = []
    
    let itunesAPI = "https://itunes.apple.com/search"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        
        
        var requestManager = AFHTTPRequestOperationManager()
        
        requestManager.GET(itunesAPI + "?entity=album&term=DaftPunk", parameters: nil, success: { (request, data) -> Void in
            
            let info = data as! [String:AnyObject]
            
            self.albums = info["results"] as! [[String:AnyObject]]
            self.collectionView?.reloadData()
            
            }) { (request, error) -> Void in
                
                println(error)
                
        }
        
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
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: UICollectionViewDataSource
    
    //    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    //        //#warning Incomplete method implementation -- Return the number of sections
    //        return 0
    //    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return albums.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! AlbumCollectionViewCell
        
        
        if let artworkURL = albums[indexPath.item]["artworkUrl100"] as? String {
            
            if let url = NSURL(string: artworkURL) {
                
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), { () -> Void in
                    
                    if let imageData = NSData(contentsOfURL: url) {
                        
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            
                            let image = UIImage(data: imageData)
                            
                            cell.albumImageView.image = image
                            
                        })
                        
                        
                        
                    }
                    
                    
                })
                
                
            }
            
        }
        
        println(albums[indexPath.item])
        
        return cell
    }
    
    
    
}
