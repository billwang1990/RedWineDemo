//
//  TableCell.m
//  RedWineDemo
//
//  Created by niko on 13-5-19.
//  Copyright (c) 2013年 bill wang. All rights reserved.
//

#import "TableCell.h"

@implementation TableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    
    CGFloat half_width = self.frame.size.width/2;
    
    _text_label1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, half_width - 10, 20)];
    _text_label1.backgroundColor = [UIColor clearColor];
    [_text_label1 setFont:[UIFont fontWithName:@"Courier" size:16]];
    
    
    _text_label2 = [[UILabel alloc]initWithFrame:CGRectMake(half_width, 5, half_width-10, 20)];
    _text_label2.backgroundColor = [UIColor clearColor];
    [_text_label2 setFont:[UIFont fontWithName:@"Courier" size:16]];
    
    [self.contentView  addSubview:_text_label1];
    [self.contentView  addSubview:_text_label2];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
