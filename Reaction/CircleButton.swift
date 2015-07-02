//
//  CircleButton.swift
//  Reaction
//
//  Created by Reed Carson on 7/1/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import Foundation
import UIKit


@IBDesignable class CircleButton: UIButton {
    
    @IBInspectable var fillColor: UIColor = UIColor.whiteColor()
    
    var choice: Int!
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        fillColor.set()
        
        CGContextFillEllipseInRect(context, rect)
        
        
    }
    
    
    
    
}
