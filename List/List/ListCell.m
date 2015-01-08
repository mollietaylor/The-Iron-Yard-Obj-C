//
//  ListCell.m
//  List
//
//  Created by Mollie on 1/7/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "ListCell.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@implementation ListCell
{
    UIView *colorView;
    
    BOOL isDone;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
//    pass through style and reuseIdentifier
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        colorView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 30, 20, 20, 20)];
        colorView.layer.cornerRadius = colorView.bounds.size.width / 2;
        
        [self.contentView addSubview:colorView];
        
    }
    return self;
    
}

// override so when we do "cell.itemInfo =", the info will come through
- (void)setItemInfo:(NSDictionary *)itemInfo {
    
    colorView.backgroundColor = itemInfo[@"color"];
    self.textLabel.text = itemInfo[@"text"];
    self.detailTextLabel.text = itemInfo[@"date"];
    
    isDone = [itemInfo[@"done"] boolValue];
    
    if (isDone) {
        colorView.backgroundColor = [UIColor blackColor];
        colorView.layer.borderColor = [UIColor whiteColor].CGColor;
        colorView.layer.borderWidth = 1.0f;
        NSDictionary* attributes = @{
                                     NSStrikethroughStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle]
                                     };
    
        NSAttributedString* attrText = [[NSAttributedString alloc] initWithString:itemInfo[@"text"] attributes:attributes];
        self.textLabel.attributedText = attrText;
    }
    
    _itemInfo = itemInfo;
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    
    if (CGRectContainsPoint(colorView.frame, touchLocation)) {
        NSLog(@"Touch in colorView.");
        if (colorView.backgroundColor == [UIColor redColor]) {
            colorView.backgroundColor = [UIColor yellowColor];
        } else if (colorView.backgroundColor == [UIColor yellowColor]) {
            colorView.backgroundColor = [UIColor greenColor];
        } else if (colorView.backgroundColor == [UIColor greenColor]) {
            colorView.backgroundColor = [UIColor redColor];
        }
    } else {
//        // move this somewhere
//        isDone = [self.itemInfo[@"done"] boolValue];
//        
//        if (!isDone) {
//            self.itemInfo[@"done"] = @YES;
//        }
    }
    
    NSLog(@"Touch in cell.");
}

@end
