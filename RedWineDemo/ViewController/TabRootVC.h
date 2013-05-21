//
//  TabRootVC.h
//  RedWineDemo
//
//  Created by xyhh on 13-5-16.
//  Copyright (c) 2013年 bill wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "ZBarReaderViewController.h"
#import "ZBarImageScanner.h"


@interface TabRootVC : BaseViewController<ZBarReaderDelegate,UITabBarControllerDelegate, UITabBarDelegate>

@property (nonatomic) ZBarReaderViewController *reader;

@end
