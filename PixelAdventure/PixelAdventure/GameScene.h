//
//  GameScene.h
//  PixelAdventure
//

//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GameScene : SKScene

- (void)movePixelInDirection:(CGVector)direction;

-(void)normalAttack;

-(void)specialAttack;


@end
