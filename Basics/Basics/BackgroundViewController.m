//
//  BackgroundViewController.m
//  Basics
//
//  Created by Mollie on 1/5/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "BackgroundViewController.h"

@interface BackgroundViewController ()

@end

@implementation BackgroundViewController

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

- (IBAction)backgroundButton:(id)sender {
    UIButton *button = (UIButton*)sender;
    UIView *view = self.view;
    UIColor *buttonColor = button.backgroundColor;
    [view setBackgroundColor:buttonColor];
}
@end
