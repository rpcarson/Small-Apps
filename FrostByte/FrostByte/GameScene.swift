//
//  GameScene.swift
//  FrostByte
//
//  Created by Reed Carson on 6/24/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
   
    var ballSize: CGFloat = 20
    
    var snowman: SKSpriteNode!
    
    
    override func didMoveToView(view: SKView) {
      
        snowman = childNodeWithName("snowman") as! SKSpriteNode
        
        buildLayout(stageLayout)
        
        let atlas = SKTextureAtlas(named: "snowman")
        
        var textures: [SKTexture] = []
        
//        for textureName in atlas.textureNames as! [String] {
        
        for i in 0..<atlas.textureNames.count {
        
        let texture = SKTexture(imageNamed: "snowman\(i)")
            
            println("snowman\(i)")
            
            textures.append(texture)
            
        }
        
        let action = SKAction.animateWithTextures(textures, timePerFrame: 0.1)
        
        let forever = SKAction.repeatActionForever(action)
        
        snowman.runAction(forever)
//
        
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
  
        for touch in (touches as! Set<UITouch>) {
           
            let snowmanhead = SKShapeNode(ellipseOfSize: CGSizeMake(20, 20))
            
            snowmanhead.fillColor = UIColor.yellowColor()
            
         
            
            snowmanhead.physicsBody = SKPhysicsBody(circleOfRadius: 10)
            
              snowmanhead.physicsBody?.mass = 1
         
            snowmanhead.position = CGPointMake(100, 100)
            addChild(snowmanhead)
            
            snowmanhead.physicsBody?.applyImpulse(CGVectorMake(10000, 100))
            
        }
    }
    
    
    
    
    func buildLayout(layout: [Block]) {
       
        let gridSize: CGFloat = 20
        let gridMetric = (frame.width / 2) / gridSize
        
        for block in layout {
            
            let size = CGSizeMake(block.wide * gridMetric, block.tall * gridMetric)
            
            let blockNode = SKShapeNode(rectOfSize: size, cornerRadius: 4)
            
          
            let x = (block.left * gridMetric) + (size.width / 2) + (frame.width / 2)
            let y = (block.bottom * gridMetric) + (size.height / 2) + 20
            
            
            blockNode.position = CGPointMake(x, y)
            
            blockNode.strokeColor = UIColor.blackColor()
            blockNode.fillColor = UIColor.orangeColor()
            
            blockNode.physicsBody = SKPhysicsBody(rectangleOfSize: size)
            
            addChild(blockNode)
            
        }
        
        
        
    }
   
    override func update(currentTime: CFTimeInterval) {
       
        
        
        
    }
}

struct Block {
    
    var left: CGFloat!
    
    var bottom: CGFloat!
    
    var wide: CGFloat!
    
    var tall: CGFloat!
    
    
    init(left l: CGFloat, bottom b: CGFloat, wide w: CGFloat, tall t: CGFloat) {
        
        left = l
        bottom = b
        wide = w
        tall = t
        
    }
    
}

let stageLayout: [Block] = [

    Block(left: 5, bottom: 0, wide: 1, tall: 3),
    Block(left: 7, bottom: 0, wide: 1, tall: 3),
    Block(left: 10, bottom: 0, wide: 1, tall: 3),
    Block(left: 12, bottom: 0, wide: 1, tall: 3),
    
    Block(left: 6, bottom: 5, wide: 1, tall: 3),
    Block(left: 11, bottom: 5, wide: 1, tall: 3),
   
    Block(left: 5, bottom: 4, wide: 3, tall: 1),
    Block(left: 10, bottom: 4, wide: 3, tall: 1),
    
   

]










