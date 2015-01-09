//
//  FriendsTVC.m
//  GithubFriends
//
//  Created by Mollie on 1/8/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "FriendsTVC.h"
#import "FriendCell.h"
#import "NewFriendVC.h"
#import "FriendDetailVC.h"

@interface FriendsTVC ()

@end

@implementation FriendsTVC
{
    NSMutableArray  *friends;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    friends = [@[
                 
                 @{
                     @"login": @"mollietaylor",
                     @"id": @1919101,
                     @"avatar_url": @"https://avatars.githubusercontent.com/u/1919101?v=3",
                     @"name": @"Mollie Taylor",
                     @"company": @"Proximity Viz LLC",
                     @"blog": @"http://proximityviz.com",
                     @"location": @"Atlanta, GA, USA",
                     @"email": @"mollie@proximityviz.com",
                     @"public_repos": @17,
                     @"public_gists": @34,
                     @"followers": @14,
                     @"following": @14
                    }
                 ] mutableCopy];
    
    [self.tableView registerClass:[FriendCell class] forCellReuseIdentifier:@"friendCell"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *addFriendButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addFriend)];
    
    self.navigationItem.rightBarButtonItem = addFriendButton;
    self.navigationItem.title = @"Your Friends";
    
}

- (void)addFriend {
    
    // add friend to array
    
    UINavigationController *nC = [[UINavigationController alloc] init];
    
    NewFriendVC *newFriendVC = [[NewFriendVC alloc] init];
    
    newFriendVC.view.backgroundColor = [UIColor colorWithRed:0.94 green:0.45 blue:0 alpha:1];
    
    newFriendVC.friends = friends;
    
    nC.viewControllers = @[newFriendVC];
    
    [self presentViewController:nC animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return friends.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FriendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"friendCell" forIndexPath:indexPath];
    
    
//    cell = [[FriendCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"friendCell"];
    
    NSDictionary *friendInfo = friends[indexPath.row];
    
    cell.textLabel.text = friendInfo[@"name"];
    
    cell.detailTextLabel.text = friendInfo[@"location"];
    
    NSURL *avatarURL = [NSURL URLWithString:friendInfo[@"avatar_url"]];
    
    NSData *imageData = [NSData dataWithContentsOfURL:avatarURL];
    
    UIImage *image = [UIImage imageWithData:imageData];
    
    cell.imageView.image = image;
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
