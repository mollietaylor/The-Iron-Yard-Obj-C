//
//  Mouth.h
//  Human
//
//  Created by Mollie on 1/6/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Tooth;

@interface Mouth : NSObject

@property (nonatomic) Tooth *tooth;

@property (nonatomic) BOOL *lipstick;
@property (nonatomic) int *numberOfTeeth;

@end
