//
//  AnimateCell.m
//  RedWineDemo
//
//  Created by niko on 13-5-21.
//  Copyright (c) 2013年 bill wang. All rights reserved.
//

#import "AnimateCell.h"

@interface AnimateCell()
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@end

@implementation AnimateCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor clearColor];
        
        _width = [UIScreen mainScreen].applicationFrame.size.width;
        _height = [UIScreen mainScreen].applicationFrame.size.height;
        
        _cellView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _width, 40)];
        _cellView.clipsToBounds = YES;
        
        _enteredView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _width, _height)];
        
        [self layoutCellView];
        
        [self addSubview:_enteredView];
        [self addSubview:_cellView];
        
    }
    return self;
}

-(void)layoutCellView
{
    self.cellText = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, self.width, 20)];
    self.cellText.font = [UIFont fontWithName:@"Marker Felt" size:18];
    self.cellText.backgroundColor = [UIColor clearColor];
    [self.cellView addSubview:self.cellText];
    
}

-(void)changeContent:(BOOL)expand
{
    if (expand) {
        self.enteredView.hidden = NO;
        self.enteredView.alpha = 0.0;
        self.cellView.alpha = 1.0;
        [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionAllowAnimatedContent animations:^{
            self.enteredView.alpha = 1.0;
            self.cellView.alpha = 0.0;
        }completion:^(BOOL finished){
            self.cellView.hidden = YES;
        }];
    }
    else{
        self.cellView.hidden = NO;
        self.enteredView.alpha = 1.0;
        self.cellView.alpha = 0.0;
        [UIView animateWithDuration:0.8 delay:0.0 options:UIViewAnimationOptionAllowAnimatedContent animations:^{
            self.enteredView.alpha = 0;
            self.cellView.alpha = 1.0;
        }completion:^(BOOL finished){
            self.enteredView.hidden = YES;
        }];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
