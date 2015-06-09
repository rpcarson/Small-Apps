//
//  GameScene.m
//  PixelAdventure
//
//  Created by Reed Carson on 6/8/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

{
    
    SKShapeNode* pixel;
    
}

-(void)didMoveToView:(SKView *)view {
   
    
    
    
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:view.frame];
    
//    SKFieldNode* field = [SKFieldNode radialGravityField];
//    
//    field.position = view.center;
//    field.strength = 1;
//    
//    [self addChild:field];
    
    
    self.backgroundColor = [UIColor blackColor];
    
    pixel = [SKShapeNode shapeNodeWithEllipseOfSize:CGSizeMake(25, 25)];
    
    pixel.fillColor = [UIColor cyanColor];
    pixel.strokeColor = [UIColor blackColor];
    pixel.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:12.5];
    pixel.glowWidth = 2;
    pixel.strokeColor = [UIColor redColor];
    pixel.position = CGPointMake(10, 10);

//    pixel.physicsBody.friction = 150;
    [self addChild:pixel];
}

- (void)movePixelInDirection:(CGVector)direction {
    
//    [pixel.physicsBody applyImpulse:direction];
//    [pixel.physicsBody applyForce:direction];
    
    CGFloat newX = pixel.position.x + direction.dx;
    CGFloat newY = pixel.position.y + direction.dy;
    
    pixel.position = CGPointMake(newX, newY);
    
}

- (void)normalAttack {
    
    SKShapeNode* babyPixel = [SKShapeNode shapeNodeWithEllipseOfSize:CGSizeMake(10, 10)];
    
    babyPixel.fillColor = [UIColor blueColor];
    babyPixel.strokeColor = [UIColor blackColor];
    
    babyPixel.position = CGPointMake(pixel.position.x + 10, pixel.position.y + 10);
    
    [self addChild:babyPixel];
    
    babyPixel.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:5];
    
    babyPixel.physicsBody.affectedByGravity = NO;
    
    [babyPixel.physicsBody applyImpulse:CGVectorMake(10, 0)];
    
}

- (void)specialAttack {
    
    SKEmitterNode* fireball = [SKEmitterNode nodeWithFileNamed:@"attack"];
    
    fireball.position = CGPointMake(pixel.position.x + 10, pixel.position.y + 10);
    
    [self addChild:fireball];
    
    fireball.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:5];
    
    fireball.physicsBody.affectedByGravity = YES;
    
    [fireball.physicsBody applyImpulse:CGVectorMake(2.5, 2.5)];

    
}

//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
//    for (UITouch *touch in touches) {
//        
//        CGPoint location = [touch locationInNode:self];
//        
//        SKShapeNode* pixel = [SKShapeNode shapeNodeWithEllipseOfSize:CGSizeMake(25, 25)];
//        
//        pixel.fillColor = [UIColor cyanColor];
//        pixel.strokeColor = [UIColor blackColor];
//
//        pixel.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:12.5];
//        pixel.glowWidth = 1;
//        pixel.strokeColor = [UIColor redColor];
//        
//        pixel.position = location;
//        [self addChild:pixel];
//        
//    }


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
