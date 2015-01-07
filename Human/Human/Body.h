//
//  Body.h
//  Human
//
//  Created by Mollie on 1/6/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Leg;
@class Head;
@class Arm;


@interface Body : NSObject

@property (nonatomic) Leg *leftLeg;
@property (nonatomic) Leg *rightLeg;
@property (nonatomic) Head *head;
@property (nonatomic) Arm *leftArm;
@property (nonatomic) Arm *rightArm;

@property (nonatomic) int *numberOfArms;
@property (nonatomic) int *numberOfLegs;

@end
