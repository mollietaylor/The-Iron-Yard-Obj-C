//
//  LoginVC.m
//  My Friends
//
//  Created by Mollie on 1/25/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "LoginVC.h"

@interface LoginVC ()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.loginButton.layer.cornerRadius = 4;
    self.loginButton.layer.borderWidth = 1;
    self.loginButton.layer.borderColor = [UIColor whiteColor].CGColor;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
