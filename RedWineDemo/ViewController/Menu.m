//
//  Menu.m
//  RedWineDemo
//
//  Created by niko on 13-5-20.
//  Copyright (c) 2013年 bill wang. All rights reserved.
//

#import "Menu.h"
#import "Head.h"
#import "NVSlideMenuController.h"

@interface Menu ()

@property (nonatomic) NSArray *typeArray;
@property (nonatomic) NSArray *originArray;
@property (nonatomic) NSArray *fenquArray;
@property (nonatomic) NSArray *sugarArray;

@end

@implementation Menu

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:initialRed/255.0f green:initialGreen/255.0f blue:initialBlue/255.0f alpha:1.0f];
    
    self.typeArray = [NSArray arrayWithObjects:@"全部",@"红葡萄酒",@"白葡萄酒", @"桃红葡萄酒", @"香槟气泡酒", @"强化型葡萄酒",nil];
    
    self.originArray = [NSArray arrayWithObjects:@"全部", @"中国", @"西班牙", @"法国", @"意大利", @"美国", @"智利", @"澳大利亚", @"以色列", @"南非", @"新西兰", @"德国", @"葡萄牙", nil];
    
    
    self.fenquArray = [NSArray arrayWithObjects:@"全部", @"日常餐酒区", @"各国优质产区酒", @"烈级名庄酒", nil];
    
    self.sugarArray = [NSArray arrayWithObjects:@"全部", @"干型葡萄酒", @"半干型葡萄酒", @"半甜型葡萄酒", @"甜型葡萄酒", @"无酒精葡萄酒", nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)typeBtnClick:(UIButton *)sender {
    
    if(typedropDown == nil) {
        CGFloat f = 200;
        typedropDown = [[NIDropDown alloc] initWithSenderBtn :sender itemHeight:f dataArray:self.typeArray imageArray:nil expandDirection:@"down"];
        //dropDown = [[NIDropDown alloc]showDropDown:sender :&f :arr :arrImage :@"down"];
        typedropDown.delegate = self;
    }
    if (!typedropDown.isOpen) {
        [typedropDown showDropDown:sender];
    }
    else {
        [typedropDown hideDropDown:sender];
    }
}

- (IBAction)originBtnClick:(id)sender {
 
    if(origindropDown == nil) {
        CGFloat f = 200;
       origindropDown = [[NIDropDown alloc] initWithSenderBtn :sender itemHeight:f dataArray:self.originArray imageArray:nil expandDirection:@"down"];
        origindropDown.delegate = self;
    }
    
    if (!origindropDown.isOpen) {
        [origindropDown showDropDown:sender];
    }
    else {
        [origindropDown hideDropDown:sender];
    }
}

- (IBAction)fenquBtnClick:(id)sender {
 
    if(fenqudropDown == nil) {
        CGFloat f = 200;
         fenqudropDown = [[NIDropDown alloc] initWithSenderBtn :sender itemHeight:f dataArray:self.fenquArray imageArray:nil expandDirection:@"down"];
        fenqudropDown.delegate = self;
    }
    
    if (!fenqudropDown.isOpen) {
        [fenqudropDown showDropDown:sender];
    }
    else {
        [fenqudropDown hideDropDown:sender];
    }
}

- (IBAction)sugarBtnClick:(UIButton *)sender {
  
    if(sugardropDown == nil) {
        CGFloat f = 200;
        sugardropDown = [[NIDropDown alloc] initWithSenderBtn :sender itemHeight:f dataArray:self.sugarArray imageArray:nil expandDirection:@"down"];
        sugardropDown.delegate = self;
    }
    if (!sugardropDown.isOpen) {
        [sugardropDown showDropDown:sender];
    }
    else {
        [sugardropDown hideDropDown:sender];
    }

}

- (void) niDropDownDelegateMethod: (NIDropDown *) sender {
    
}


@end
