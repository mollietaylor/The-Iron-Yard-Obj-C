//
//  Rectangle.m
//  Shapes
//
//  Created by Mollie on 1/13/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, self.red, self.green, self.blue, 1);
    CGContextFillRect(context, rect);
    
}
@end
