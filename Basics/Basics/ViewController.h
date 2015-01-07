//
//  ViewController.h
//  Basics
//
//  Created by Mollie on 1/5/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)clearFormButtonPressed:(id)sender;
- (IBAction)submitButtonPressed:(id)sender;


@end

