//
//  ViewController.m
//  Speaking
//
//  Created by Mollie on 1/13/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"

@interface ViewController () <MyViewDelegate>
{
    MyView *view1;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    view1 = [[MyView alloc] init];
    
    // let self listen to view1
    view1.delegate = self;
    
    view1.name = @"Bob";
    
    NSLog(@"view1 name = %@", view1.name);
    
}

- (void)changeMyNameTo:(NSString *)name {
    
    NSLog(@"%@", name);
    
    view1.name = name;
    
    NSLog(@"view1 new name: %@", view1.name);
    
}

@end
