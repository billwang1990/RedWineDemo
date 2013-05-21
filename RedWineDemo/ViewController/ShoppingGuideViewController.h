//
//  ShoppingGuideViewController.h
//  RedWineDemo
//
//  Created by niko on 13-5-20.
//  Copyright (c) 2013年 bill wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShoppingGuideViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) UITableViewController *table;
@property (nonatomic) NSArray *dataArray;
@property (nonatomic) int level;
@property (nonatomic) int currentIndex;

-(id)initWithLevel: (int)level;

@end
