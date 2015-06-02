//
//  AddViewController.m
//  TrialsByFire
//
//  Created by Reed Carson on 6/1/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@property (weak, nonatomic) IBOutlet UITextField *lightlyUsedItemTextField;

- (IBAction)addItemPressed:(id)sender;


@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addItemPressed:(id)sender {

    [self.items addObject:self.lightlyUsedItemTextField.text];

    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
