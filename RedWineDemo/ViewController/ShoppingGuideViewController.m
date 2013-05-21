//
//  ShoppingGuideViewController.m
//  RedWineDemo
//
//  Created by niko on 13-5-20.
//  Copyright (c) 2013年 bill wang. All rights reserved.
//

#import "ShoppingGuideViewController.h"
#import "Head.h"
#import "ProductListViewController.h"

@interface ShoppingGuideViewController ()

@end

@implementation ShoppingGuideViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithLevel: (int)level{
    if (self = [super init]) {
       _level = level;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
        
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:initialRed/255.0f green:initialGreen/255.0f blue:initialBlue/255.0f alpha:1.0f];

    self.table = [[UITableViewController alloc ]init];
    [self.table.tableView setFrame:self.view.frame];

    self.table.tableView.dataSource = self;
    self.table.tableView.delegate = self;
    self.table.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    self.table.tableView.backgroundColor = [UIColor clearColor];
 

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    
//    self.originArray = [NSArray arrayWithObjects:@"全部", @"中国", @"西班牙", @"法国", @"意大利", @"美国", @"智利", @"澳大利亚", @"以色列", @"南非", @"新西兰", @"德国", @"葡萄牙", nil];
    
   [self.view addSubview:self.table.tableView];
    
    
    [self.table.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma uitableviewdelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell  = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle  reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.font = [UIFont fontWithName:@"Courier" size:18];
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.level+1 == 1) {
        
        ShoppingGuideViewController *guide = [[ShoppingGuideViewController alloc]initWithLevel: self.level+1];
        guide.currentIndex = indexPath.row;
        guide.title = [self.dataArray objectAtIndex:indexPath.row];
        //选择的国家分支
        if (indexPath.row == 0) {
            guide.dataArray = [NSArray arrayWithObjects: @"中国", @"西班牙", @"法国", @"意大利", @"美国", @"智利", @"澳大利亚", @"以色列", @"南非", @"新西兰", @"德国", @"葡萄牙", @"全部", nil];
        }
        //选择场合分支
        else if(indexPath.row == 1)
        {
            guide.dataArray = [NSArray arrayWithObjects: @"送礼", @"收藏", @"婚宴", @"商务", @"自饮", @"聚会", @"全部", nil];
        }
        //选择葡萄分支
        else if(indexPath.row == 2)
        {
            guide.dataArray = [NSArray arrayWithObjects:@"天普", @"全部", nil];
        }
        
        [self.navigationController pushViewController:guide animated:YES];
    }
    else if(self.level+1 == 2)
    {
        //选择国家分支中的下一级分支
        if (self.currentIndex == 0) {
            ShoppingGuideViewController *guide = [[ShoppingGuideViewController alloc]initWithLevel: self.level+1];
            guide.currentIndex = indexPath.row;
            guide.title = [self.dataArray objectAtIndex:indexPath.row];
            guide.dataArray = [NSArray arrayWithObjects:@"日常餐酒系列", @"各国优质产区酒", @"烈级名庄酒", @"全部", nil];
            [self.navigationController pushViewController:guide animated:YES];
        }
        else
        {
            //展示产品列表
            ProductListViewController *product = [[ProductListViewController alloc]init];
            [self.navigationController pushViewController:product animated:YES];
        }
    }
    else if(self.level +1 == 3)
    {
        //展示产品列表
        //展示产品列表
        ProductListViewController *product = [[ProductListViewController alloc]init];
        [self.navigationController pushViewController:product animated:YES];
    }
    else
    {
        return;
    }
    [self.table.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
