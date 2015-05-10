


// may 7th homework


//normal mode

// Make box a circle
// randomize the circle size (width will be same as height)
//randomize the color of the circle
// randomize the alpha of the circle


// middle mode
// transition to alpha 0 after 1 second (something to do with UIView animation?)


// Hard mode

// randomize whether or not it is round (whether aspect ratio is constant)
// randomize between full circle and rounded square and square
// randomize rotation of box





//
//  cocoTouchAdventuresTwoTheReckoning.swift
//  FromScratch
//
//  Created by Reed Carson on 5/7/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit

class cocoTouchAdventuresTwoTheReckoning: UIView {
    
    func randomColor() -> UIColor{
        
        var randomRed:CGFloat = CGFloat(drand48())
        var randomGreen:CGFloat = CGFloat(drand48())
        var randomBlue:CGFloat = CGFloat(drand48())
        var randomAlpha:CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: randomAlpha)
    }
    
    
    
    override func didMoveToWindow() {
        
        
        backgroundColor = randomColor()
        
//        var width = frame.size.width
//        var hieght = frame.size.height
//        var circle = layer.cornerRadius
        
        var randomNum = arc4random_uniform(100)
        var randomNum2 = arc4random_uniform(100)
        var ran3 = arc4random_uniform(20)
        
        frame.size.width = CGFloat(randomNum)
        frame.size.height = CGFloat(randomNum)
        
//            self.layer.cornerRadius = CGFloat(ran3)
        
//                 self.layer.cornerRadius = self.frame.size.width / CGFloat(ran3)
        
        self.layer.cornerRadius = self.frame.size.width / 2
        
        
    }

}

class cocobox: UIView {
    
    func randomColor() -> UIColor{
        
        var randomRed:CGFloat = CGFloat(drand48())
        var randomGreen:CGFloat = CGFloat(drand48())
        var randomBlue:CGFloat = CGFloat(drand48())
        var randomAlpha:CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: randomAlpha)
    }
    
    
    
    override func didMoveToWindow() {
        
        
        backgroundColor = randomColor()
        
        //        var width = frame.size.width
        //        var hieght = frame.size.height
        //        var circle = layer.cornerRadius
        
        var randomNum = arc4random_uniform(100)
        var randomNum2 = arc4random_uniform(100)
        
        
        frame.size.width = CGFloat(randomNum)
        frame.size.height = CGFloat(randomNum2)
        
        
    }
    
}




class cocorounded: UIView {
    
    func randomColor() -> UIColor{
        
        var randomRed:CGFloat = CGFloat(drand48())
        var randomGreen:CGFloat = CGFloat(drand48())
        var randomBlue:CGFloat = CGFloat(drand48())
        var randomAlpha:CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: randomAlpha)
    }
    
    
    
    override func didMoveToWindow() {
        
        
        backgroundColor = randomColor()
        
        //        var width = frame.size.width
        //        var hieght = frame.size.height
        //        var circle = layer.cornerRadius
        
        var randomNum = arc4random_uniform(100)
        var randomNum2 = arc4random_uniform(100)
        
        
        frame.size.width = CGFloat(randomNum)
        frame.size.height = CGFloat(randomNum2)
        
        self.layer.cornerRadius = 10
        
        
    }
    
}

