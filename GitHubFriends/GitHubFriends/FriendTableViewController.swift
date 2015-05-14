//
//  FriendTableViewController.swift
//  GitHubFriends
//
//  Created by Reed Carson on 5/12/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit

class FriendTableViewController: UITableViewController {
    

    @IBOutlet weak var reposButton: UIButton!
    @IBOutlet weak var gistsButton: UIButton!
    @IBOutlet weak var friendNameLabel: UILabel!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    
    
    @IBOutlet weak var nameField: UITextField!
    

   
    @IBOutlet weak var addFVisual: UIButton!
    
    @IBOutlet weak var avatarSquare: avatarImage!
    
    
    
    
    var friends: [[String:AnyObject?]] = [
    
        [
            "login": "rpcarson",
            "id": 12224921,
            "avatar_url": "https://avatars.githubusercontent.com/u/12224921?v=3",
            "gravatar_id": "",
            "url": "https://api.github.com/users/rpcarson",
            "html_url": "https://github.com/rpcarson",
            "followers_url": "https://api.github.com/users/rpcarson/followers",
            "following_url": "https://api.github.com/users/rpcarson/following{/other_user}",
            "gists_url": "https://api.github.com/users/rpcarson/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/rpcarson/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/rpcarson/subscriptions",
            "organizations_url": "https://api.github.com/users/rpcarson/orgs",
            "repos_url": "https://api.github.com/users/rpcarson/repos",
            "events_url": "https://api.github.com/users/rpcarson/events{/privacy}",
            "received_events_url": "https://api.github.com/users/rpcarson/received_events",
            "type": "User",
            "site_admin": false,
            "name": "Reed Carson",
            "company": "",
            "blog": "",
            "location": "",
            "email": "rpcarson27@gmail.com",
            "hireable": false,
            "bio": nil,
            "public_repos": 1,
            "public_gists": 0,
            "followers": 8,
            "following": 9,
            "created_at": "2015-05-03T20:43:03Z",
            "updated_at": "2015-05-04T17:57:56Z"
        ]
    
    
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
//   profileButton.layer.cornerRadius = 8
   
    
   
    
    }
    
    
    @IBAction func addFriend(sender: AnyObject) {
        
        
        let endpoint = "https://api.github.com/users/\(nameField.text)"
        
        
        println("hehhehehe")
      
               
        if let friendInfo = GitHubRequest.getInfoWithEndpoint(endpoint) as? [String:AnyObject?] {
        
        lastUserCreated = nameField.text
        friends.insert(friendInfo, atIndex: 0)
        tableView.reloadData()
        
        }
        nameField.text = ""
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Potentially incomplete method implementation.
//        // Return the number of sections.
//        return 0
//    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return friends.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("friendCell", forIndexPath: indexPath) as! UITableViewCell
        
//        cell.textLabel?.text = friends[indexPath.row]["name"] as? String

        // Configure the cell...
        
//     var image = UIImage(named: (friends[indexPath.row]["avatar_url"] as? String)!)
       
        let avatarURL = NSURL(string: friends[indexPath.row]["avatar_url"]! as! String)
        
        let imageData = NSData(contentsOfURL: avatarURL!)
        
        let image = UIImage(data: imageData!)
        
//        cell.imageView!.image = image
//    
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            friends.removeAtIndex(indexPath.row)
            
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "reposSegue" {
        
        
        var reposTVC = segue.destinationViewController as! ReposTableViewController
        
        var reposButton = sender as! UIButton
        
        reposTVC.friendInfo = friends[reposButton.tag]
        
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
        
    }
    

}
