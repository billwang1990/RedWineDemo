//
//  ProductDetailViewController.h
//  RedWineDemo
//
//  Created by niko on 13-5-21.
//  Copyright (c) 2013年 bill wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductDetailViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIImageView *image;
@property (nonatomic, strong) UITableView *tableview;

@end
