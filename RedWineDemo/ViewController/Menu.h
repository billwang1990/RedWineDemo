//
//  Menu.h
//  RedWineDemo
//
//  Created by niko on 13-5-20.
//  Copyright (c) 2013年 bill wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NIDropDown.h"

@interface Menu : UIViewController<NIDropDownDelegate>
{
    NIDropDown *typedropDown;
    NIDropDown *origindropDown;
    NIDropDown *fenqudropDown;
    NIDropDown *sugardropDown;
}
@property (weak, nonatomic) IBOutlet UIButton *typeBtn;
@property (weak, nonatomic) IBOutlet UIButton *originBtn;
@property (weak, nonatomic) IBOutlet UIButton *fenquBtn;
@property (weak, nonatomic) IBOutlet UIButton *sugarBtn;
- (IBAction)typeBtnClick:(UIButton *)sender;
- (IBAction)originBtnClick:(UIButton *)sender;
- (IBAction)fenquBtnClick:(UIButton*)sender;
- (IBAction)sugarBtnClick:(UIButton *)sender;

@end
