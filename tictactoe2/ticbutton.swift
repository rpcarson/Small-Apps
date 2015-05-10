//
//  ticbutton.swift
//  tictactoe2
//
//  Created by Reed Carson on 5/8/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit


enum Player {
    
    case One
    case Two
    
}


@IBDesignable class ticbutton: UIButton {

    
    @IBInspectable var row: Int = 0
    @IBInspectable var col: Int = 0

    
    var player: Player?
    
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        var context = UIGraphicsGetCurrentContext()
        
        UIColor.lightGrayColor().set()
        

        var insetRect = CGRectInset(rect, 1, 1)
        
        
        CGContextStrokeEllipseInRect(context, insetRect)
//         CGContextSetLineWidth(context, 10)
        
        
        
        
        if let playerUnwrapped = player {
        
         UIColor.orangeColor().set()
            
            if playerUnwrapped == Player.Two {
                
                UIColor.greenColor().set()
                
            }
            

        var smallCircleRect = CGRectInset(rect, 40 , 40)
        
        CGContextFillEllipseInRect(context, smallCircleRect)
        
        }
        
        
       

        
        //        CGContextFillEllipseInRect(context, rect)
   
    
    }

}
