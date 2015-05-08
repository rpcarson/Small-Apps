//
//  ViewController.swift
//  FromScratch
//
//  Created by Reed Carson on 5/7/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        for touch in touches as! Set<UITouch> {
            //  " as " is a way to change type hierarchy downwards
            
            
            var box = cocoTouchAdventuresTwoTheReckoning()

            
            let location = touch.locationInView(view)
            println("x = \(location.x) and y = \(location.y)")
            
            view.addSubview(box)
            box.center = location
        }
        
    }
    
    
}







//        var view2 = UIView(frame: CGRectMake(150, 150, 100, 100))
//        view2.backgroundColor = UIColor.redColor()
//
//
//        var view3 = UIView(frame: CGRectMake(200   , 200, 100, 100))
//        view3.backgroundColor = UIColor.yellowColor()
//
//        var view4 = UIView(frame: CGRectMake(250   , 250, 100, 100))
//        view4.backgroundColor = UIColor(red:0.3, green:0.4, blue:0.21, alpha:1)
//
//        var view5 = UIView(frame: CGRectMake(100  , 100, 200, 200))
//        view5.backgroundColor = UIColor(red:0.22, green:0.25, blue:0.27, alpha:1)
//
//        view.addSubview(view5)
//        view.addSubview(view1)
//        view.addSubview(view2)   ;  view.addSubview(view3)


//    self - refers to object we are currenty working with







