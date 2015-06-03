//
//  CameraViewController.m
//  TakeASelfie
//
//  Created by Reed Carson on 6/3/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

#import "CameraViewController.h"
#import "ViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface CameraViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation CameraViewController


{
    
    UIImagePickerController* imagePickerController;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    imagePickerController = [[UIImagePickerController alloc] init];
//    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePickerController.delegate = self;

//    imagePickerController.showsCameraControls = NO;
   
    [self.view addSubview:imagePickerController.view];
    
    int buttonSize = 80;
    
    UIButton* takeButton = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - buttonSize) / 2, SCREEN_HEIGHT - 40 - buttonSize, buttonSize, buttonSize)];
    
    takeButton.layer.cornerRadius = buttonSize / 2;
    takeButton.backgroundColor = [UIColor colorWithRed:1 green:0.76 blue:0.21 alpha:1];
    
    [takeButton addTarget:imagePickerController action:@selector(takePicture) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:takeButton];
    
    
    
    UIButton* toggleCamera = [[[UIButton alloc] init] initWithFrame:CGRectMake((SCREEN_WIDTH * 0.75) - 25, 0, 50, 50)];
    
//    toggleCamera.center.y = takeButton.center.y;
    toggleCamera.center = CGPointMake(toggleCamera.center.x, takeButton.center.y);
    
    toggleCamera.layer.cornerRadius = 25;
    toggleCamera.backgroundColor = [UIColor colorWithRed:0.91 green:0.3 blue:0.27 alpha:1];
    
    [self.view addSubview:toggleCamera];
    
    [toggleCamera addTarget:self action:@selector(toggleCamera) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}

//- (void)takePhoto {
//    
//    [imagePickerController takePicture];
//    NSLog(@"take photo");
//}

-(void)toggleCamera {
    
    if (imagePickerController.cameraDevice == UIImagePickerControllerCameraDeviceFront) {
        
        
        imagePickerController.cameraDevice = UIImagePickerControllerCameraDeviceRear;
        
    }else{
        
        
    }

    imagePickerController.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage* original = info[UIImagePickerControllerOriginalImage];
    
    
    NSLog(@"%@",original);
    
    ViewController* imageVC = [self.storyboard instantiateViewControllerWithIdentifier:@"imageVC"];
    

    imageVC.original = original;
    
    [self.navigationController pushViewController:imageVC animated:YES];
    
//    self.imageView.image = original;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

@end
