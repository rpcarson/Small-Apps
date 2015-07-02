//
//  MotionScene.swift
//  Level
//
//  Created by Reed Carson on 6/29/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit
import SpriteKit

let dot = SKShapeNode(ellipseOfSize: CGSize(width: 35, height: 35))


class MotionScene: SKScene {
    

    
    
    override func didMoveToView(view: SKView) {
        
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        
        size = view.frame.size
        
        backgroundColor = UIColor.blackColor()
        
        
        
        dot.position = view.center
//        dot.position = CGPoint(x: posX, y: posY)
        dot.fillColor = UIColor.redColor()
        
        addChild(dot)
        
        dot.physicsBody = SKPhysicsBody(circleOfRadius: 10)
        
    physicsBody = SKPhysicsBody(edgeLoopFromRect: view.bounds)
        
        
    }
    
}
