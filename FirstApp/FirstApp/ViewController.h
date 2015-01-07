//
//  ViewController.h
//  FirstApp
//
//  Created by Mollie on 1/5/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic) IBOutlet UILabel *myLabel;

@property (weak, nonatomic) IBOutlet UITextField *myTextField;

- (IBAction)bigButtonPressed:(id)sender;


@end

