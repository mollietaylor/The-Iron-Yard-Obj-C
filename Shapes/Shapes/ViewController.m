//
//  ViewController.m
//  Shapes
//
//  Created by Mollie on 1/13/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "ViewController.h"
#import "Triangle.h"
#import "Ellipse.h"
#import "Rectangle.h"

// make 3 classes based on UIView (Rectangle, Ellipse, Triangle)
// uncomment the drawRect function
// google CGContext drawing in drawRect
// 10 different shapes with different colors

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    [self makeTriangleWithX:10 withY:10 withWidth:100 withHeight:100 withRed:0.73 withGreen:0.34 withBlue:0.2];
    [self makeEllipseWithX:110 withY:10 withWidth:100 withHeight:100 withRed:0.73 withGreen:0.47 withBlue:0.63];
    [self makeRectangleWithX:210 withY:10 withWidth:100 withHeight:100 withRed:0.28 withGreen:0.25 withBlue:0.20];
    [self makeRectangleWithX:10 withY:110 withWidth:100 withHeight:100 withRed:0.28 withGreen:0.25 withBlue:0.20];
    [self makeEllipseWithX:110 withY:110 withWidth:50 withHeight:50 withRed:0.73 withGreen:0.58 withBlue:0.29];
    [self makeEllipseWithX:160 withY:110 withWidth:50 withHeight:50 withRed:0.73 withGreen:0.58 withBlue:0.29];
    [self makeEllipseWithX:110 withY:160 withWidth:50 withHeight:50 withRed:0.73 withGreen:0.58 withBlue:0.29];
    [self makeEllipseWithX:160 withY:160 withWidth:50 withHeight:50 withRed:0.73 withGreen:0.58 withBlue:0.29];
    [self makeTriangleWithX:210 withY:110 withWidth:100 withHeight:100 withRed:0.73 withGreen:0.34 withBlue:0.2];
    [self makeTriangleWithX:10 withY:210 withWidth:300 withHeight:200 withRed:0.87 withGreen:0.87 withBlue:0.87];
    
    
}

- (void)makeTriangleWithX:(CGFloat)x withY:(CGFloat)y withWidth:(CGFloat)width withHeight:(CGFloat)height withRed:(CGFloat)red withGreen:(CGFloat)green withBlue:(CGFloat)blue {
    Triangle *triangle = [[Triangle alloc] initWithFrame:CGRectMake(x, y, width, height)];
    triangle.red = red;
    triangle.green = green;
    triangle.blue = blue;
    [self.view addSubview:triangle];
}

- (void)makeEllipseWithX:(CGFloat)x withY:(CGFloat)y withWidth:(CGFloat)width withHeight:(CGFloat)height withRed:(CGFloat)red withGreen:(CGFloat)green withBlue:(CGFloat)blue {
    Ellipse *ellipse = [[Ellipse alloc] initWithFrame:CGRectMake(x, y, width, height)];
    ellipse.red = red;
    ellipse.green = green;
    ellipse.blue = blue;
    [self.view addSubview:ellipse];
}

- (void)makeRectangleWithX:(CGFloat)x withY:(CGFloat)y withWidth:(CGFloat)width withHeight:(CGFloat)height withRed:(CGFloat)red withGreen:(CGFloat)green withBlue:(CGFloat)blue {
    Rectangle *rectangle = [[Rectangle alloc] initWithFrame:CGRectMake(x, y, width, height)];
    rectangle.red = red;
    rectangle.green = green;
    rectangle.blue = blue;
    [self.view addSubview:rectangle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
