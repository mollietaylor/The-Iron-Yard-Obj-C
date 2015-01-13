//
//  MyView.m
//  Speaking
//
//  Created by Mollie on 1/13/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (void)setName:(NSString *)name {

    if ([name isEqualToString:@"Bob"]) {
        
        [self.delegate changeMyNameTo:@"BOSS"];
        return;
        
    }
    
    _name = name;
    
}

@end
