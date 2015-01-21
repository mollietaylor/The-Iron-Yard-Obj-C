//
//  OptionsVC.m
//  ScribbleTouch
//
//  Created by Mollie on 1/14/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "OptionsVC.h"
#import "ScribbleView.h"

@interface OptionsVC ()

@end

@implementation OptionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)changeColor:(UIButton *)sender {
    
    self.selectedColor = sender.backgroundColor;
    
}

- (IBAction)changeFillColor:(UIButton *)sender {
    
    self.selectedFillColor = sender.backgroundColor;
    
}

- (IBAction)changeStrokeWidth:(UISlider *)sender {
    
    self.selectedStrokeWidth = sender.value;
    
}

- (IBAction)changeAlpha:(UISlider *)sender {
    
    self.selectedAlpha = sender.value;
    
}


- (IBAction)reset:(UIButton*)sender {
    
    ScribbleView *sView = (ScribbleView *) self.view;
    [sView.scribbles removeAllObjects];
    [sView setNeedsDisplay];
    
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
