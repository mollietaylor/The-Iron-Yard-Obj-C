//
//  Human.m
//  Speaking
//
//  Created by Mollie on 1/13/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "Human.h"
#import "Robot.h"

@interface Human () <RobotDelegate>

@end

@implementation Human

- (void)makeRobot {
    
    Robot *oldRustyRobot = [[Robot alloc] init];
    
    // let oldRustyRobot talk to self
    oldRustyRobot.delegate = self;
    
    [oldRustyRobot cleanHouse];
    
    [oldRustyRobot dance];
    
}

- (NSString *)whatTypeOfDance {
    
    return @"Rumba";
    
}

- (int)howManyRoomsDoIHaveToClean {
    
    return 1000000;
    
}

@end
