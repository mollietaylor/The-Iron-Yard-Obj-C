//
//  FriendDetailVC.m
//  GithubFriends
//
//  Created by Mollie on 1/8/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "FriendDetailVC.h"

@interface FriendDetailVC () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation FriendDetailVC
{
    NSArray *repos;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *username = self.friendInfo[@"login"];
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.github.com/users/%@/repos", username];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSLog(@"%@", url);
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    repos = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, 320, 518) style:UITableViewStylePlain];

    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    cell.textLabel.text = repos[indexPath.row][@"name"];
    
    if (repos[indexPath.row][@"description"] != [NSNull null]) {
        cell.detailTextLabel.text = repos[indexPath.row][@"description"];
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return repos.count;
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
