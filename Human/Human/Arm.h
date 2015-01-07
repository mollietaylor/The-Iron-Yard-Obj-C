//
//  Arm.h
//  Human
//
//  Created by Mollie on 1/6/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Hand;

// Create 2 methods on each class (e.g. Mouth will have - (void)chewFood:(id)food;)

// Add 2 properties per class that define the part (not including properties like finger)

@interface Arm : NSObject

@property (nonatomic) Hand *hand;

@property (nonatomic) int *numberOfHands;
@property (nonatomic) BOOL *isLeft;

@end
