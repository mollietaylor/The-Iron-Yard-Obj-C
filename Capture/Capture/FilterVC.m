//
//  FilterVC.m
//  Capture
//
//  Created by Mollie on 1/20/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "FilterVC.h"
#import "FilterCell.h"

@interface FilterVC () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *filterImageView;
@property (weak, nonatomic) IBOutlet UICollectionView *filterCollectionView;

@property (nonatomic) NSArray *filters;

@end

@implementation FilterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.filters = [CIFilter filterNamesInCategory:kCICategoryColorEffect];
    
    NSLog(@"%@", self.filters);
    
    self.filterCollectionView.delegate = self;
    self.filterCollectionView.dataSource = self;
    
    self.filterImageView.image = [self filterImage:self.originalImage withFilterName:self.filters[0]];
}

- (void)setOriginalImage:(UIImage *)originalImage {
    
    _originalImage = originalImage;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.filters.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    FilterCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"filterCell" forIndexPath:indexPath];
    
    NSString *filterName = self.filters[indexPath.item];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        
        UIImage *filterImage = [self filterImage:self.originalImage withFilterName:filterName];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            cell.imageView.image = filterImage;
            
        });
        
    });
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *filterName = self.filters[indexPath.item];
    
    UIImage *filterImage = [self filterImage:self.originalImage withFilterName:filterName];
    
    self.filterImageView.image = filterImage;
    
}

- (UIImage *)filterImage:(UIImage *)originalImage withFilterName:(NSString *)filterName {
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [[CIImage alloc] initWithCGImage:originalImage.CGImage];
    CIFilter *filter = [CIFilter filterWithName:filterName];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    CGRect extent = [result extent];
    CGImageRef cgImage = [context createCGImage:result fromRect:extent];
    
    return [UIImage imageWithCGImage:cgImage scale:originalImage.scale orientation:originalImage.imageOrientation];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//
//{
//[filter setValue:@0.8f forKey:kCIInputIntensityKey];




//CIFilter *bumpDistortion = [CIFilter filterWithName:@"CIBumpDistortion"];    // 1
//[bumpDistortion setDefaults];                                                // 2
//[bumpDistortion setValue: result forKey: kCIInputImageKey];
//[bumpDistortion setValue: [CIVector vectorWithX:200 Y:150]
//                  forKey: kCIInputCenterKey];                              // 3
//[bumpDistortion setValue: @100.0f forKey: kCIInputRadiusKey];                // 4
//[bumpDistortion setValue: @3.0f forKey: kCIInputScaleKey];                   // 5
//result = [bumpDistortion valueForKey: kCIOutputImageKey];
//
//}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
