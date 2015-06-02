//
//  ViewController.m
//  TrialsByFire
//
//  Created by Reed Carson on 6/1/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  
    
    NSMutableString* name = [@"Jo" mutableCopy];
    
    NSString* oldName = name;
    
    [name insertString:@"Cool " atIndex:0];
    
    name = [@"Troll" mutableCopy];
    
    NSLog(@"%@",oldName);



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
