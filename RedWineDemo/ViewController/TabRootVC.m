//
//  TabRootVC.m
//  RedWineDemo
//
//  Created by xyhh on 13-5-16.
//  Copyright (c) 2013年 bill wang. All rights reserved.
//

#import "TabRootVC.h"
#import "Home.h"
#import "MoreViewController.h"
#import "HonourViewController.h"
#import "NVSlideMenuController.h"
#import "ShoppingGuideViewController.h"
#import "Menu.h"

@implementation TabRootVC

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    //first viewcontroller
    
    self.delegate = self;
    ShoppingGuideViewController *guide = [[ShoppingGuideViewController alloc]initWithLevel:0];
    guide.dataArray = [NSArray arrayWithObjects:@"国家", @"场合", @"葡萄品种", nil];
    guide.title = @"分类";
    
    UINavigationController *guide_nav = [[UINavigationController alloc]initWithRootViewController:guide];
    guide_nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"导购" image:[UIImage imageNamed:@"wine_bottle.png"] tag:0] ;
    
    Home *home = [[Home alloc]initWithNibName:@"Home" bundle:nil];
    UINavigationController *home_nav = [[ UINavigationController  alloc]initWithRootViewController:home];
    home_nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Gorriti" image:[UIImage imageNamed:@"wine_bottle.png"] tag:1] ;


    //holdplace view controller
    UIViewController *demo = [[UIViewController alloc]init];
    demo.tabBarItem = [[UITabBarItem alloc]initWithTitle:nil image:nil tag:2];
    
    //third viewcontroller
    HonourViewController *honour = [[HonourViewController alloc]initWithNibName:@"HonourViewController" bundle:nil];
    
    UINavigationController *honour_nav = [[UINavigationController alloc]initWithRootViewController:honour];
    honour_nav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"荣誉" image:[UIImage imageNamed:@"cup.png"] tag:3];

    //fourth viewcontroller
    MoreViewController *more = [[MoreViewController alloc]initWithNibName:@"MoreViewController" bundle:nil];

    UINavigationController *more_nav = [[UINavigationController alloc]initWithRootViewController:more];
    more_nav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"更多" image:[UIImage imageNamed:@"more.png"] tag:4];
    
    
    self.viewControllers = [NSArray arrayWithObjects:guide_nav ,demo, honour_nav,  nil];
    
    
    UIButton *btn = [self addCenterButtonWithImage:[UIImage imageNamed:@"camera_button_take.png"] highlightImage:[UIImage imageNamed:@"tabBar_cameraButton_ready_matte.png"]];
    
    [btn addTarget:self action:@selector(scanBar) forControlEvents:UIControlEventTouchUpInside];
}

-(void)scanBar
{
    self.reader = [[ZBarReaderViewController alloc]init];
    self.reader.readerDelegate = self;
    
    //非全屏
    self.reader.wantsFullScreenLayout = NO;
    
    //隐藏底部控制按钮
    self.reader.showsZBarControls = NO;
    
    [self setOverlayPickerView:self.reader];
    
    [self.reader.scanner setSymbology: ZBAR_I25
                               config: ZBAR_CFG_ENABLE
                                   to: 0];


    [self presentViewController:self.reader animated:YES completion:nil];
    //[self.navigationController pushViewController:self.reader animated:YES];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    id<NSFastEnumeration> results =
    [info objectForKey: ZBarReaderControllerResults];
    
    //UIImage *image = [info objectForKey: UIImagePickerControllerOriginalImage];
    
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        break;
    NSLog(@"扫描信息%@",symbol.data);
    
    [self dismissOverlayView];
}


-(void)dismissOverlayView
{
    [self.reader dismissViewControllerAnimated:YES completion:nil];
    //[self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)setOverlayPickerView:(ZBarReaderViewController *)reader
{
    //清除原有控件
    for (UIView *temp in [reader.view subviews]) {
        for (UIButton *button in [temp subviews]) {
            if ([button isKindOfClass:[UIButton class]]) {
                [button removeFromSuperview];
            }
        }
        for (UIToolbar *toolbar in [temp subviews]) {
            if ([toolbar isKindOfClass:[UIToolbar class]]) {
                [toolbar setHidden:YES];
                [toolbar removeFromSuperview];
            }
        }
    }
    /*
     //画中间的基准线
     UIView* line = [[UIView alloc] initWithFrame:CGRectMake(40, 220, 240, 1)];
     line.backgroundColor = [UIColor blueColor];
     [reader.view addSubview:line];
     */
    //最上部view
    UIView* upView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 80)];
    upView.alpha = 0.3;
    upView.backgroundColor = [UIColor blackColor];
    
    [reader.view addSubview:upView];
    
    //用于说明的label
    UILabel * labIntroudction= [[UILabel alloc] init];
    labIntroudction.backgroundColor = [UIColor clearColor];
    labIntroudction.frame=CGRectMake(15, 20, 290, 50);
    labIntroudction.numberOfLines=2;
    labIntroudction.textColor=[UIColor whiteColor];
    labIntroudction.text=@"置二维码图像于矩形方框内，离手机摄像头10CM左右，系统会自动识别";
    [upView addSubview:labIntroudction];
    
    
    //左侧的view
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 80, 20, 280)];
    leftView.alpha = 0.3;
    leftView.backgroundColor = [UIColor blackColor];
    [reader.view addSubview:leftView];
    
    //右侧的view
    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(300, 80, 20, 280)];
    rightView.alpha = 0.3;
    rightView.backgroundColor = [UIColor blackColor];
    [reader.view addSubview:rightView];
    
    
    //底部view
    UIView * downView = [[UIView alloc] initWithFrame:CGRectMake(0, 360, 320, 120)];
    downView.alpha = 0.3;
    downView.backgroundColor = [UIColor blackColor];
    [reader.view addSubview:downView];
    
    //用于取消操作的button
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    cancelButton.alpha = 0.4;
    [cancelButton setFrame:CGRectMake(20, 390, 280, 40)];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton.titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    [cancelButton addTarget:self action:@selector(dismissOverlayView)forControlEvents:UIControlEventTouchUpInside];
    
    [reader.view addSubview:cancelButton];
}

-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if ([tabBarController.viewControllers indexOfObject:viewController] == 1) {
        [self scanBar];
        return NO;
    }
    else{
        return YES;
    }
}

 
@end
