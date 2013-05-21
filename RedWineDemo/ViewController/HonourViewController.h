//
//  HonourViewController.h
//  RedWineDemo
//
//  Created by niko on 13-5-20.
//  Copyright (c) 2013年 bill wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoStackView.h"

@interface HonourViewController : UIViewController<PhotoStackViewDataSource, PhotoStackViewDelegate>

@property (nonatomic) PhotoStackView *photoStack;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end
