//
//  Finger.m
//  Human
//
//  Created by Mollie on 1/6/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "Finger.h"

@implementation Finger

// if you need to override both the getter and setter, you need to use @synthesize

// create a _fingerPrint local instance variable
@synthesize fingerPrint = _fingerPrint;

- (NSString *)fingerPrint { // this is a getter method
    return _fingerPrint;
}


// passes in a fingerPrint value and sets the local instance variable to that parameter
- (void)setFingerPrint:(NSString *)fingerPrint {
    
    _fingerPrint = fingerPrint;
    
}

// setters and getters get called automatically, but you can also manually call them

- (void)biteNail:(id)nail {
    
}

- (BOOL)hasRing {
    return YES;
}

@end
