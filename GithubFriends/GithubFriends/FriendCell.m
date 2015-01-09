//
//  FriendCell.m
//  GithubFriends
//
//  Created by Mollie on 1/8/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "FriendCell.h"
#import "FriendDetailVC.h"

@implementation FriendCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UINavigationController *nC = [[UINavigationController alloc] init];
    
    FriendDetailVC *friendDetailVC = [[FriendDetailVC alloc] init];
    
    friendDetailVC.view.backgroundColor = [UIColor colorWithRed:0.94 green:0.45 blue:0 alpha:1];
    
    NSString *name = self.textLabel.text;
    
    friendDetailVC.friendInfo[@"login"] = name;
    
    nC.viewControllers = @[friendDetailVC];
    
    [nC pushViewController:friendDetailVC animated:YES];
    
}

@end
