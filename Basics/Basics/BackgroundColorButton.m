//
//  BackgroundColorButton.m
//  Basics
//
//  Created by Mollie on 1/5/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "BackgroundColorButton.h"

@implementation BackgroundColorButton

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.layer.cornerRadius = self.frame.size.width / 2;
    self.layer.masksToBounds = YES;
}

@end
