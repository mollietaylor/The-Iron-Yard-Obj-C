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
//        colorView.layer.cornerRadius = self.frame.size.width / 2;
//        colorView.layer.masksToBounds = YES;
        
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
        NSDictionary* attributes = @{
                                     NSStrikethroughStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle]
                                     };
    
        NSAttributedString* attrText = [[NSAttributedString alloc] initWithString:itemInfo[@"text"] attributes:attributes];
        self.textLabel.attributedText = attrText;
    }
    
    _itemInfo = itemInfo;
    
}

@end
