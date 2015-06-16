//
//  ViewController.swift
//  TallFeather
//
//  Created by Reed Carson on 6/15/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var myName: String?
    
    var chatMessages: [String:[String:AnyObject]] = [:]
   
    @IBOutlet weak var chatField: UITextField!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var nameButton: UIButton!
    
    
  
    @IBOutlet weak var messageTableView: UITableView!
    
    
    
    var myFirebase = Firebase(url: "https://secret-room.firebaseio.com")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageTableView.dataSource = self
        messageTableView.dataSource = self
       
        // Read data and react to changes
        myFirebase.observeEventType(.Value, withBlock: {
            snapshot in
           
            
            if let data = snapshot.value as? [String:AnyObject] {
        
            
            self.chatMessages = data["messages"] as! [String:[String:AnyObject]]
                
                self.messageTableView.reloadData()
            
            }
        })
    
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   
        
        return chatMessages.values.array.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("messageCell") as! UITableViewCell
       
       let message = chatMessages.values.array[indexPath.row]
        
        cell.textLabel?.text = message["name"] as? String
        cell.detailTextLabel?.text = message["message"] as? String
        
        return cell
        
    }
    
    @IBAction func setMessage(sender: AnyObject) {
   
        
        let firebaseMessages = myFirebase.childByAppendingPath("messages")
    
        let firebaseMessage = firebaseMessages.childByAutoId()
        
        let message =
        [
            "message" : chatField.text,
            "name" : myName
        ]
      
        chatField.text = ""
        
        firebaseMessage.setValue(message)
        
    }
    
    @IBAction func setName(sender: AnyObject) {
    
    myName = chatField.text
        
        nameButton.hidden = true
        messageButton.hidden = false
        
        chatField.text = ""
    
    }
   


}

