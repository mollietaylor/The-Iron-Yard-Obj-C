//
//  FriendsTVC.m
//  My Friends
//
//  Created by Mollie on 1/22/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "FriendsTVC.h"
#import <Parse/Parse.h>

@interface FriendsTVC ()

@end

@implementation FriendsTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [PFUser currentUser].username = @"Mollie";
    [PFUser currentUser].password = @"secret";
    
    [[PFUser currentUser] saveInBackground];
    
//    self.friends = [@[] mutableCopy];
    
//    PFQuery *friendsQuery = [PFQuery queryWithClassName:@"Users"];
//    
//    [friendsQuery whereKey:@"username" equalTo:@"Mollie"];
////    [friendsQuery whereKey:@"username" equalTo:[PFUser currentUser]];
//    
//    [friendsQuery includeKey:@"friends"];
//    
//    [friendsQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        
//        if (objects.count > 0) {
//            self.friends = [objects mutableCopy];
//        }
//        
//        NSLog(@"%@", self.friends);
//        
//    }];

    
    PFQuery *userQuery = [PFUser query];
#warning Should be current user
    [userQuery whereKey:@"username" equalTo:@"Mollie"];
    [userQuery includeKey:@"friends"];
    NSArray *usersFromQuery = [userQuery findObjects];
    for (PFUser *friend in usersFromQuery) {
        self.friends = friend[@"friends"];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.friends.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.friends[indexPath.row];
//    cell.textLabel.text = @"stuff";
    
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
