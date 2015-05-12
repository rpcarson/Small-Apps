//
//  priButt.swift
//  HighPriority
//
//  Created by Reed Carson on 5/11/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit



@IBDesignable class priButt: UIButton {

   
    override func drawRect(rect: CGRect) {
        
        var context = UIGraphicsGetCurrentContext()
        
        UIColor.lightGrayColor().set()
        
        
        var insetRect = CGRectInset(rect, 1, 1)
        
        
        CGContextStrokeEllipseInRect(context, insetRect)
        //         CGContextSetLineWidth(context, 10)
            
            
            var smallCircleRect = CGRectInset(rect, 40 , 40)
            
            CGContextFillEllipseInRect(context, smallCircleRect)
            
        }

    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
