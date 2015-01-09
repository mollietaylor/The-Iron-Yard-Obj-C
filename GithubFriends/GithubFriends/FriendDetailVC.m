//
//  FriendDetailVC.m
//  GithubFriends
//
//  Created by Mollie on 1/8/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "FriendDetailVC.h"

@interface FriendDetailVC ()

@end

@implementation FriendDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    NSString *username = self.friendInfo[@"login"];
//    
//    NSString *urlString = [NSString stringWithFormat:@"https://api.github.com/users/%@/repos", username];
//    NSURL *url = [NSURL URLWithString:urlString];
//    
//    NSLog(@"%@", url);
    
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    
//    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//    
//    NSArray *userRepos = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];
//    
//    NSLog(@"%@", userRepos);
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
