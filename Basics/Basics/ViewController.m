//
//  ViewController.m
//  Basics
//
//  Created by Mollie on 1/5/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "ViewController.h"

// create 2 view controllers on the main storyboard

// view controller 1
// - 2 buttons: one will clear textfields; one will log all textfields)
// - 3 textfields (username, email, password)
// - password field should look like one by hiding the text with dots
// - email field should use email keyboard

// view controller 2
// - 4 buttons with different color backgrounds
// - each button changes the main view controller's background color, all four triggering the same method

// add constraints
// make buttons on view controller 2 circles

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clearFormButtonPressed:(id)sender {
    self.usernameField.text = nil;
    self.emailField.text = nil;
    self.passwordField.text = nil;
    
}

- (IBAction)submitButtonPressed:(id)sender {
    NSLog(@"Username: %@", self.usernameField.text);
    NSLog(@"Email: %@", self.emailField.text);
    NSLog(@"Password: %@", self.passwordField.text);
}

@end
