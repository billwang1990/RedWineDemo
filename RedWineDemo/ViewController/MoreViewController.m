//
//  MoreViewController.m
//  RedWineDemo
//
//  Created by xyhh on 13-5-15.
//  Copyright (c) 2013年 bill wang. All rights reserved.
//

#import "MoreViewController.h"
#import "ZBarReaderViewController.h"
#import "ZBarImageScanner.h"
#import "Head.h"

@interface MoreViewController ()<UITableViewDataSource, UITableViewDelegate,ZBarReaderDelegate>

@property (nonatomic) ZBarReaderViewController *reader;
@property (nonatomic) UITableViewController *table;

@end

@implementation MoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.table = [[UITableViewController alloc]initWithStyle:UITableViewStyleGrouped ];    

    [self.table.tableView setFrame:self.view.frame];
    
    self.table.tableView.dataSource = self;
    self.table.tableView.delegate =self;
    
    self.table.tableView.scrollEnabled = NO;

    [self.view addSubview:self.table.view];

    self.title = @"更多";
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:initialRed/255.0f green:initialGreen/255.0f blue:initialBlue/255.0f alpha:1.0f];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma uitableviewcontroller delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    if(indexPath.row == 0)
    {
        cell.textLabel.text = @"关于";
    }
    else if(indexPath.row == 1)
    {
        cell.textLabel.text = @" ";
    }
    else if(indexPath.row == 2)
    {
        cell.textLabel.text = @" ";
    }
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
    if(indexPath.row == 0)
    {
         
    }
}
@end
