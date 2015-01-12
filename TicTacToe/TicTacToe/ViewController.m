//
//  ViewController.m
//  TicTacToe
//
//  Created by Mollie on 1/12/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *player1ScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *player2ScoreLabel;

@end

@implementation ViewController
{
    int playerTurn;
    int gameNumber;
    
    NSMutableArray *squares;
    
    NSMutableArray *buttons;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self resetGame];
    
    buttons = [@[] mutableCopy];
    
    gameNumber = 0;
    
    int rowCount = 3;
    int colCount = 3;
    
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenBound.size.width;
    
    CGFloat width = (screenWidth - 40) / 3;
    CGFloat height = width;
    
    int buttonCount = 0;
    
    for (int r = 0; r < rowCount; r++) {
        
        for (int c = 0; c < colCount; c++) {
            
            CGFloat x = c * (width + 10) + 10;
            CGFloat y = r * (height + 10) + 10 + 20 + 50;
            
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x, y, width, height)];
            
            button.backgroundColor = [UIColor colorWithRed:0.97 green:0.71 blue:0.05 alpha:1];
            
            [button.titleLabel setFont:[UIFont boldSystemFontOfSize:50]];
            button.tag = buttonCount;
            
            [button addTarget:self action:@selector(squareTapped:) forControlEvents:UIControlEventTouchUpInside];
            [button addTarget:self action:@selector(checkForWin) forControlEvents:UIControlEventTouchUpInside];
            
            [self.view addSubview:button];
            [buttons addObject:button];
            
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
    
    if (playerTurn == 1) {
        button.backgroundColor = [UIColor colorWithRed:0.1 green:0.59 blue:0.37 alpha:1];
    } else {
        button.backgroundColor = [UIColor colorWithRed:0.94 green:0.45 blue:0 alpha:1];
    }
    
    playerTurn = (playerTurn == 2) ? 1 : 2;

    
}

- (void)checkForWin {
    
    // check for win
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
    
    #warning A win on the last move counts as a draw and a win
    [self checkForDraw];
    
}

- (void)checkForDraw {
    
    NSNumber *min = [squares valueForKeyPath:@"@min.self"];
    NSLog(@"%@", min);
    
    if (![squares containsObject:@0]) {
        NSString *message = [NSString stringWithFormat:@"The game was a draw."];
        UIAlertView *alertViewDraw = [[UIAlertView alloc] initWithTitle:@"Draw" message:message delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
        [alertViewDraw show];
        gameNumber++;
    }
    
}

- (void)checkWinPossibility:(NSArray *)winPossibility withPlayer:(int)player {
    BOOL playerInSquare1 = ([squares[[winPossibility[0] intValue]] intValue] == player);
    BOOL playerInSquare2 = ([squares[[winPossibility[1] intValue]] intValue] == player);
    BOOL playerInSquare3 = ([squares[[winPossibility[2] intValue]] intValue] == player);
    
    if (playerInSquare1 && playerInSquare2 && playerInSquare3) {
        NSString *message = [NSString stringWithFormat:@"Player %d won", player];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Winner" message:message delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
        if (player == 1) {
            self.player1Score++;
            self.player1ScoreLabel.text = [NSString stringWithFormat:@"Player 1: %d", self.player1Score];
        } else {
            self.player2Score++;
            self.player2ScoreLabel.text = [NSString stringWithFormat:@"Player 2: %d", self.player2Score];
        }
        [alertView show];
        gameNumber++;
    }
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    // square titles
    for (UIButton *button in buttons) {
        [button setTitle:@"" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor colorWithRed:0.97 green:0.71 blue:0.05 alpha:1];
    }
    
    [self resetGame];
    
}

# pragma mark - Reset game

- (void)resetGame {
    
    playerTurn = gameNumber % 2 + 1;
    
    squares = [@[
                 @0, @0, @0,
                 @0, @0, @0,
                 @0, @0, @0
                 ] mutableCopy];
    
}

# pragma mark - Reset score

- (IBAction)resetButtonPressed:(id)sender {
    self.player1ScoreLabel.text = @"Player 1: 0";
    self.player1Score = 0;
    self.player2ScoreLabel.text = @"Player 2: 0";
    self.player2Score = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
