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


var arteests = artistSearch

let reuseIdentifier = "albumCell"
let itunesAPI = "https://itunes.apple.com/search"
let itunesLookupAPI = "https://itunes.apple.com/lookup"




class AlbumCollectionViewController: UICollectionViewController,  UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
  
  

 
  
    
    
    
    
    var albums: [[String:AnyObject]] = []
    
    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        
        
        var requestManager = AFHTTPRequestOperationManager()
        
        requestManager.GET(itunesAPI + "?entity=album&term=Radiohead", parameters: nil, success: { (request, data) -> Void in
            
            let info = data as! [String:AnyObject]
            
            self.albums = info["results"] as! [[String:AnyObject]]
            self.collectionView?.reloadData()
            
            }) { (request, error) -> Void in
                
                println(error)
                
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "sectionHeader", forIndexPath: indexPath) as! UICollectionReusableView
        
        
        return header
    
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let cell = sender as! AlbumCollectionViewCell
        if let indexPath = collectionView?.indexPathForCell(cell) {
            
            let albumInfo = albums[indexPath.item]
            
            let detailVC = segue.destinationViewController as! AlbumDetailViewController
            
            detailVC.albumInfo = albumInfo
            
        }
        
        
    }
   
    
//  func searchForArtists() {
//        
//        var requestManager = AFHTTPRequestOperationManager()
//        
//        requestManager.GET(itunesAPI + "?entity=album&term=\(arteests)", parameters: nil, success: { (request, data) -> Void in
//            
//            let info = data as! [String:AnyObject]
//            
//            self.albums = info["results"] as! [[String:AnyObject]]
//            self.collectionView?.reloadData()
//            
//            }) { (request, error) -> Void in
//                
//                println(error)
//                
//        }
//
//        
//    }
    
}
