//
//  Head.h
//  Human
//
//  Created by Mollie on 1/6/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Hair;
@class Eye;
@class Nose;
@class Ear;
@class Mouth;

@interface Head : NSObject

@property (nonatomic) Hair *hair;
@property (nonatomic) Eye *leftEye;
@property (nonatomic) Eye *rightEye;
@property (nonatomic) Nose *nose;
@property (nonatomic) Ear *leftEar;
@property (nonatomic) Ear *rightEar;
@property (nonatomic) Mouth *mouth;

@property (nonatomic) int *numberOfEyes;
@property (nonatomic) int *numberOfEars;

@end
