//
//  Human.h
//  Human
//
//  Created by Mollie on 1/6/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Body;
@class Head;

@interface Human : NSObject

@property (nonatomic) Body *body;
@property (nonatomic) Head *head;

@end
