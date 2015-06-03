//
//  ViewController.m
//  TakeASelfie
//
//  Created by Reed Carson on 6/3/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

#import "ViewController.h"
#import "FilterCollectionViewCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *filterCollectionView;


@end

@implementation ViewController

{
    
    NSArray* filters;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.image = self.original;
    
    filters = [CIFilter filterNamesInCategory:kCICategoryColorEffect];
    
    self.filterCollectionView.dataSource = self;
    self.filterCollectionView.delegate = self;
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return filters.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    FilterCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"filterCell" forIndexPath:indexPath];
    
    NSString* filterName = filters[indexPath.item];
    
    cell.imageView.image = [self filterImage:self.original withName:filterName];
    
    return cell;
    
    
    
}

- (UIImage* )filterImage:(UIImage*)originalImage withName:(NSString*)filterName {
    
    CIContext* context = [CIContext contextWithOptions:nil];               // 1
    
    CIImage* image = [CIImage imageWithCGImage:originalImage.CGImage];               // 2
    
    CIFilter* filter = [CIFilter filterWithName:filterName];           // 3
    
    [filter setValue:image forKey:kCIInputImageKey];
    
//    [filter setValue:@0.8f forKey:kCIInputIntensityKey];
    
    CIImage* result = [filter valueForKey:kCIOutputImageKey];              // 4
    
    CGRect extent = [result extent];
    
    CGImageRef cgImage = [context createCGImage:result fromRect:extent];   // 5
    
    return [UIImage imageWithCGImage:cgImage];
    
}






@end
