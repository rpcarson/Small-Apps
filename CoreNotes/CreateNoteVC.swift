//
//  CreateNoteVC.swift
//  CoreNotes
//
//  Created by Reed Carson on 6/23/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit
import CoreData

//3
// add a catergories relationsheep for the new note

//  add tags comma seperated for new note +HaRd MoDe
// text fild and buddon to add tag, (only count displayed on note)



var appDelegate: AppDelegate = {
    
    UIApplication.sharedApplication().delegate as! AppDelegate
    
}()

//var moc: NSManagedObjectContext? = {
//
//return (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
//
//    }()


class CreateNoteVC: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func createNote(sender: AnyObject) {
   
        if let moc = appDelegate.managedObjectContext {
            
            let catEntity = NSEntityDescription.entityForName("Category", inManagedObjectContext: moc)
            
            let request = NSFetchRequest()
            
            request.entity = catEntity
            
            if let catObjects = moc.executeFetchRequest(request, error: nil)  as?  [NSManagedObject] {
            
            var newObject = NSEntityDescription.insertNewObjectForEntityForName("Note", inManagedObjectContext: moc) as! NSManagedObject
         
            newObject.setValue(textField.text, forKey: "content")
            newObject.setValue(NSDate(), forKey: "created")
            
            let catObject = catObjects[0]
                
                newObject.setValue(catObject, forKey: "category")
                
                
                
                }
            
            
            
            
            
            
            appDelegate.saveContext()
            
            dismissViewControllerAnimated(true, completion: nil)
        
        }
    
       
    
    
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
