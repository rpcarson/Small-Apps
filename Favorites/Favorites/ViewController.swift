//
//  ViewController.swift
//  Favorites
//
//  Created by Reed Carson on 5/28/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.


import UIKit
import Parse

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var myFavorites: [PFObject] = []
    
    @IBOutlet weak var buttonOne: UIButton!
    
    @IBOutlet weak var favoriteTextField: UITextField!
    
    @IBOutlet weak var favoritesTableView: UITableView!
    
    @IBAction func addFavorite(sender: AnyObject) {
        
        let newFavorite = PFObject(className: "Favorites")
        
        newFavorite["name"] = favoriteTextField.text
        newFavorite["user"] = PFUser.currentUser()
        
        newFavorite.saveInBackground()
        
        favoriteTextField.text = ""
        myFavorites.insert(newFavorite, atIndex: 0)
//        myFavorites.append(newFavorite)
        favoritesTableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        buttonOne.layer.cornerRadius = 10
        buttonOne.backgroundColor = UIColor(red:0.16, green:0.4, blue:0.64, alpha:1)
        
        favoritesTableView.dataSource = self
        favoritesTableView.delegate = self
        
        let query = PFQuery(className: "Favorites")
        
        query.orderByDescending("createdAt")
        
        
//        query.whereKey("SDcTWa1Lnc",
        
            query.whereKey("user", equalTo: PFUser.currentUser()!)
        
//         ^^^^ filter by user
        
        
        
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            
            self.myFavorites = objects as! [PFObject]
            
            self.favoritesTableView.reloadData()
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("favoriteCell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = myFavorites[indexPath.row]["name"] as? String
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myFavorites.count
    }
    
}

