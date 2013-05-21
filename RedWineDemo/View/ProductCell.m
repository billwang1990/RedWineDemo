//
//  ProductCell.m
//  RedWineDemo
//
//  Created by niko on 13-5-21.
//  Copyright (c) 2013年 bill wang. All rights reserved.
//

#import "ProductCell.h"

@implementation ProductCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.p_imageview = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.origin.x+10, self.frame.origin.y+10, 60, 60)];
        
        self.namelabel = [[UILabel alloc]initWithFrame:CGRectMake(self.p_imageview.frame.origin.x + 80, self.p_imageview.frame.origin.y+5, 160, 25)];
        for (UIView*view in self.contentView.subviews)
        {
            [view removeFromSuperview];
        }
        [self.contentView addSubview:self.p_imageview];
        [self.contentView addSubview:self.namelabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
