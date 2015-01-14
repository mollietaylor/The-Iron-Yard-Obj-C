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
    [self.fillColor set];
//    CGContextSetRGBFillColor(context, self.red, self.green, self.blue, 1);
        CGContextFillEllipseInRect(context, rect);
    
//    CGFloat w = rect.size.width;
//    CGFloat h = rect.size.height;
//    
//    CGFloat xCP = w / 4;
//    CGFloat yCP = h / 4;
//    
//    // top middle point
//    CGContextMoveToPoint(context, w / 2, 0);
//    // to right middle point
//    CGContextAddCurveToPoint(context, xCP * 3, 0, w, yCP, w, h / 2);
//    // to bottom middle point
//    CGContextAddCurveToPoint(context, w, yCP * 3, xCP * 3, h, w / 2, h);
//    // to left middle point
//    CGContextAddCurveToPoint(context, xCP, h, 0, yCP * 3, 0, h / 2);
//    // to top middle point
//    CGContextAddCurveToPoint(context, 0, yCP, xCP, 0, w / 2, 0);
    
    CGContextFillPath(context);
}



@end
