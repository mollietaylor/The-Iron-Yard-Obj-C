//
//  Ellipse.m
//  Shapes
//
//  Created by Mollie on 1/13/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "Ellipse.h"

@implementation Ellipse


- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, self.red, self.green, self.blue, 1);
    // Draw a circle (filled)
    CGContextFillEllipseInRect(context, rect);
}



@end
