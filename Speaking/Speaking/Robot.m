//
//  Robot.m
//  Speaking
//
//  Created by Mollie on 1/13/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "Robot.h"

@implementation Robot

-(void)cleanHouse {
    
    // find out from delegate how many rooms need to be cleaned
    int rooms = [self.delegate howManyRoomsDoIHaveToClean];
    
    NSLog(@"Robot starts cleaning %d rooms", rooms);
    
}

-(void)dance {
    
    NSString *dance = [self.delegate whatTypeOfDance];
    
    NSLog(@"Robot starts dancing the %@", dance);
    
}

-(void)checkPower {
    
}

@end
