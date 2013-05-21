//
//  AnimateCell.h
//  RedWineDemo
//
//  Created by niko on 13-5-21.
//  Copyright (c) 2013年 bill wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimateCell : UITableViewCell

@property (nonatomic, strong) UILabel *cellText;
@property (nonatomic, strong) UIView *cellView;
@property (nonatomic, strong) UIView *enteredView;
@property(nonatomic,strong) NSIndexPath * subIndex;

-(void)changeContent:(BOOL)expand;

@end
