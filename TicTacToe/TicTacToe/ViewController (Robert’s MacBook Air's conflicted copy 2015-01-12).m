//
//  ViewController.m
//  TicTacToe
//
//  Created by Mollie on 1/12/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController
{
    int playerTurn;
    int turn;
    
    NSMutableArray *squares;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    playerTurn = 1;
    
    turn = 0;
    
    squares = [@[@"", @"", @"", @"", @"", @"", @"", @"", @"", @""] mutableCopy];
    
    int rowCount = 3;
    int colCount = 3;
    
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenBound.size.width;
    
    CGFloat width = (screenWidth - 20) / 3;
    CGFloat height = width;
    
    int buttonCount = 0;
    
    for (int r = 0; r < rowCount; r++) {
        
        for (int c = 0; c < colCount; c++) {
            
            CGFloat x = c * (width + 10);
            CGFloat y = r * (height + 10) + 20;
            
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x, y, width, height)];
            
            button.backgroundColor = [UIColor colorWithRed:0.97 green:0.71 blue:0.05 alpha:1];
            
            [self.view addSubview:button];
            
            [button.titleLabel setFont:[UIFont boldSystemFontOfSize:50]];
            button.tag = buttonCount;
            
            [button addTarget:self action:@selector(squareTapped:) forControlEvents:UIControlEventTouchUpInside];
            [button addTarget:self action:@selector(checkForWin) forControlEvents:UIControlEventTouchUpInside];
            
            buttonCount++;
            
        }
        
    }
    
}

- (void)squareTapped:(UIButton *)button{
    
    if ([squares[button.tag] intValue] != 0) {
        return;
    }
    
    squares[button.tag] = @(playerTurn);
    
    [button setTitle:[NSString stringWithFormat:@"%d", playerTurn] forState:UIControlStateNormal];
    
    playerTurn = (playerTurn == 2) ? 1 : 2;
    
    
    
    
//#warning There must be a better way to do this
//    if ([button.titleLabel.text isEqualToString:@"X"] || [button.titleLabel.text isEqualToString:@"O"]) {
//        // nothing
//    } else {
//        if (turn %2 == 1) {
//            [button setTitle:@"X" forState:UIControlStateNormal];
//            squares[button.tag] = @"O";
//        } else {
//            [button setTitle:@"O" forState:UIControlStateNormal];
//        }
//        turn++;
//        NSLog(@"%@", squares);
//    }
    
}

- (void)checkForWin {
    
    NSArray *winPossibilies = @[
                             // rows
                             @[@0,@1,@2],
                             @[@3,@4,@5],
                             @[@6,@7,@8],
                             // cols
                             @[@0,@3,@6],
                             @[@1,@4,@7],
                             @[@2,@5,@8],
                             // diag
                             @[@0,@4,@8],
                             @[@2,@4,@6]
                             ];
    
    for (NSArray *winPossibility in winPossibilies) {
        [self checkWinPossibility:winPossibility withPlayer:1];
        [self checkWinPossibility:winPossibility withPlayer:2];
        
    }
    
}

- (void)checkWinPossibility:(NSArray *)winPossibility withPlayer:(int)player {
    BOOL playerInSquare1 = ([squares[[winPossibility[0] intValue]] intValue] == player);
    BOOL playerInSquare2 = ([squares[[winPossibility[1] intValue]] intValue] == player);
    BOOL playerInSquare3 = ([squares[[winPossibility[2] intValue]] intValue] == player);
    
    if (playerInSquare1 && playerInSquare2 && playerInSquare3) {
        NSString *playerString = [NSString stringWithFormat:@"%d", player];
        self.label.text = [[@"Player " stringByAppendingString:playerString] stringByAppendingString:@" won!"];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
