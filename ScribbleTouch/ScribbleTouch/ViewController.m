//
//  ViewController.m
//  ScribbleTouch
//
//  Created by Mollie on 1/14/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "ViewController.h"
#import "ScribbleView.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSMutableDictionary *currentScribble;
    UIColor *selectedColor;
    UIColor *selectedFillColor;
    int selectedStrokeWidth;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    selectedColor = [UIColor blackColor];
    selectedFillColor = [UIColor clearColor];
    selectedStrokeWidth = 1;
    
}

- (IBAction)changeColor:(UIButton *)sender {
    
    selectedColor = sender.backgroundColor;
    
}

- (IBAction)changeFillColor:(UIButton *)sender {
    
    selectedFillColor = sender.backgroundColor;
    
}

- (IBAction)changeStrokeWidth:(UISlider *)sender {
    
    selectedStrokeWidth = sender.value;
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = touches.allObjects.firstObject;
    
    CGPoint location = [touch locationInView:self.view];
    
    currentScribble = [@{
                         
                         @"type":@"path",
                         @"fillColor":selectedFillColor,
                         @"strokeColor":selectedColor,
                         @"strokeWidth":@(selectedStrokeWidth),
                         // when we touch, we start with one point
                         @"points":[@[[NSValue valueWithCGPoint:location]] mutableCopy]
                         
                         } mutableCopy];

    // to get access to the scribbles property of ScribbleView, we can either:
    ScribbleView *sView = (ScribbleView *) self.view;
    [sView.scribbles addObject:currentScribble];

//    // or
//    [((ScribbleView *)self.view).scribbles addObject:currentScribble];
    
    [self.view setNeedsDisplay];
    
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = touches.allObjects.firstObject;
    
    CGPoint location = [touch locationInView:self.view];
    
    [currentScribble[@"points"] addObject:[NSValue valueWithCGPoint:location]];
    
    [self.view setNeedsDisplay];
    
}

@end
