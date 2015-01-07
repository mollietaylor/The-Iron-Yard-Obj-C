//
//  Hand.h
//  Human
//
//  Created by Mollie on 1/6/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Finger;
@class Thumb;

@interface Hand : NSObject

@property (nonatomic) Finger *firstFinger;
@property (nonatomic) Finger *secondFinger;
@property (nonatomic) Finger *thirdFinger;
@property (nonatomic) Finger *fourthFinger;

@property (nonatomic) Thumb *thumb;

@property (nonatomic) int *numberOfFingers;
@property (nonatomic) int *numberOfThumbs;

@end
