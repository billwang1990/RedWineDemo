//
//  Home.h
//  RedWineDemo
//
//  Created by xyhh on 13-5-15.
//  Copyright (c) 2013年 bill wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Home : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIImageView *image;
@property (nonatomic, strong) UITableView *tableview;


@end
