//
//  MyView.h
//  Speaking
//
//  Created by Mollie on 1/13/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyViewDelegate;

@interface MyView : UIView

@property (nonatomic) NSString *name;

@property (nonatomic, assign) id <MyViewDelegate> delegate;

@end

@protocol MyViewDelegate <NSObject>
// methods in here do not run on MyView
// instead, the view tells its delegate to do them

- (void)changeMyNameTo:(NSString *)name;

@end
