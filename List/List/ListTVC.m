//
//  ListTVC.m
//  List
//
//  Created by Mollie on 1/7/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "ListTVC.h"

#import "ListCell.h"

@interface ListTVC ()

@end

@implementation ListTVC
{
    NSMutableArray *listItems;
}

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        listItems = [[NSMutableArray alloc] initWithArray:@[
                                                            
            @{
                @"text":@"Item 3",
                @"color": [UIColor redColor],
                @"done": @NO
                },
            @{
                @"text":@"Item 2",
                @"date":@"Jan 6, 2015",
                @"color": [UIColor yellowColor],
                @"done": @NO
                },
            @{
                @"text":@"Item 1",
                @"date":@"Jan 3, 2015",
                @"color": [UIColor redColor],
                @"done": @NO
                },
            @{
               @"text":@"Change font",
               @"date":@"Jan 7, 2015",
               @"color":[UIColor greenColor],
               @"done":@YES
               },
            @{
               @"text":@"Round icons",
               @"color": [UIColor redColor],
               @"done": @YES
               },
            @{
               @"text":@"Understand strikethrough code",
               @"color": [UIColor yellowColor],
               @"done": @YES
               },
            @{
               @"text":@"Change row height",
               @"date":@"Jan 7, 2015",
               @"color":[UIColor greenColor],
               @"done":@YES
               },
            @{
               @"text":@"Full separator",
               @"date":@"Jan 6, 2015",
               @"color": [UIColor redColor],
               @"done": @YES
               },
            @{
               @"text":@"Listen for cell touches",
               @"color": [UIColor greenColor],
               @"done": @YES
               },
            @{
               @"text":@"Listen for colorView touches",
               @"color":[UIColor greenColor],
               @"done":@YES
               },
            @{
               @"text":@"colorView touches change color",
               @"color":[UIColor redColor],
               @"done":@YES
               },
            @{
               @"text":@"Add 10 items to array",
               @"color": [UIColor yellowColor],
               @"done": @YES
               },
            @{
               @"text":@"Add swipe to delete graphic",
               @"color": [UIColor yellowColor],
               @"done": @YES
               },
            @{
               @"text":@"Make array mutable",
               @"color":[UIColor greenColor],
               @"done":@YES
               },
            @{
               @"text":@"Make swipe-to-delete work",
               @"color":[UIColor greenColor],
               @"done":@YES
               }
           
           ]
        
        ];
    
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return listItems.count;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        
        // if there is a date, it should init with style subtitle
        
        // otherwise, it should init with style default
        
        cell = [[ListCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        
    }
    
//    THIS PASSES INFO TO LISTCELL FROM HERE:
    cell.itemInfo = listItems[indexPath.row];
    
    cell.backgroundColor = [UIColor blackColor];
    cell.textLabel.textColor = [UIColor grayColor];
    cell.detailTextLabel.textColor = [UIColor grayColor];
    cell.textLabel.font = [UIFont fontWithName:@"Georgia" size:14];
    self.tableView.rowHeight = 60;
    
    // Configure the cell...
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [listItems removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadData];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

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
