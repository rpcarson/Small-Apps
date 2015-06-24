//
//  Constants.swift
//  CoreNotes
//
//  Created by Reed Carson on 6/23/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.



import Foundation
import UIKit





let categories: [String:(String,UIColor)] = [

    "Red" : ("Lava",UIColor.redColor()),
    "Blue" : ("Sky",UIColor.cyanColor()),
    "Yellow" : ("Lazy",UIColor.yellowColor()),
    "Purple" : ("Unicorn",UIColor.purpleColor()),
    "Orange" : ("Fruit",UIColor.orangeColor())
]

func categoryColor(name: String) -> UIColor {
    
    return categories[name]!.1
    
}



// 2
// create a global functin that returns a UIColor based on a string

enum colorString {
    
    case red
    case green
    case blue
    case yellow
}

var color1 = UIColor()

func getColorString(color: String) -> UIColor {
    
    switch color1 {
        
    case "green" :
        return UIColor.greenColor()
    case "blue" :
        return UIColor.blueColor()
    case "red" :
        return UIColor.redColor()
    case "yellow" :
        return UIColor.yellowColor()
        
    default : "shit"
        
    }
    
    return color1
    
}

let DEBUG = true