//
//  OptionsVC.h
//  ScribbleTouch
//
//  Created by Mollie on 1/14/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OptionsVC : UIViewController

@property (nonatomic) NSMutableDictionary *currentScribble;
@property (nonatomic) UIColor *selectedColor;
@property (nonatomic) UIColor *selectedFillColor;
@property (nonatomic) int selectedStrokeWidth;
@property (nonatomic) float selectedAlpha;

@end
