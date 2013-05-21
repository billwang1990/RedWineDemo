//
//  ProductDetailViewController.m
//  RedWineDemo
//
//  Created by niko on 13-5-21.
//  Copyright (c) 2013年 bill wang. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "TableCell.h"
#import "FloatView.h"

static CGFloat ImageHeight  = 180.0;
static CGFloat ImageWidth  = 320.0;

@interface ProductDetailViewController () <FloatViewDelegate>

@property (nonatomic) FloatView *floatView;
@property (nonatomic) BOOL expand;
@property (nonatomic) NSIndexPath *chosenIndexPath;
@property (nonatomic) CGRect chosenCellFrame;

@end

@implementation ProductDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)init{
    if (self = [super init]) {
        _image = [[UIImageView alloc] init];
        _image.frame = CGRectMake(0, 0, ImageWidth, ImageHeight);
        
        _tableview = [[UITableView alloc] init];
        _tableview.dataSource = self;
        _tableview.delegate = self;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        
        _tableview.backgroundColor = [UIColor clearColor];
        
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
        _floatView = [[FloatView alloc]initWithFrame:CGRectMake(0, 0, 38, 38)];
        
        
        _floatView.delegate = self;
        UIImageView *shoppingcar = [[UIImageView alloc]initWithFrame:_floatView.frame];
        [shoppingcar setImage:[UIImage imageNamed:@"shopcar.png"]];
        
        [self.floatView addSubview:shoppingcar];

        [self.view addSubview:_tableview];
        [self.view addSubview:_image];
        [self.view addSubview:self.floatView];
    }
         return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    CGRect bounds = self.view.bounds;
    self.tableview.frame = bounds;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateImg {
    CGFloat yOffset   = self.tableview.contentOffset.y;
    if (yOffset < 0) {
        
        CGFloat factor = ((ABS(yOffset)+ImageHeight)*ImageWidth)/ImageHeight;
        CGRect f = CGRectMake(-(factor-ImageWidth)/2, 0, factor, ImageHeight+ABS(yOffset));
        self.image.frame = f;
    } else {
        CGRect f = self.image.frame;
        f.origin.y = -yOffset;
        self.image.frame = f;
    }
}
#pragma mark - Table View Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self updateImg];
}

#pragma mark - Table View Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0)
		return 1;
	else if(section == 1)
		return 4;
    else
        return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0)
		return ImageHeight;
    else if(indexPath.section ==1)
    {
        return 28.0;
    }
    else
    {
        return 40;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellReuseIdentifier   = @"mycell";
    NSString *windowReuseIdentifier = @"SectionOneCell";
    NSString  *thirdReuseIdentifier = @"third";
    
    if (indexPath.section == 0) {
        
        UITableViewCell *cell = nil;
        cell = [tableView dequeueReusableCellWithIdentifier:windowReuseIdentifier];
        if (!cell) {
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:windowReuseIdentifier];
        }
        return cell;
    } else  if(indexPath.section == 1){
        
        TableCell *cell = nil;
        cell = (TableCell*)[tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier];
        if (!cell) {
            cell = [[TableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellReuseIdentifier];
        }
        if(indexPath.row == 0)
        {
            cell.text_label1.text = @"GORRITI";
        }
        else if (indexPath.row == 1) {
            cell.text_label1.text = @"葡萄品种：天普";
            cell.text_label2.text = @"酒精度：0.13";
        }
        else if (indexPath.row == 2) {
            cell.text_label1.text = @"种类：Dry";
            cell.text_label2.text = @"级别：DO";
        }
        else if (indexPath.row == 3) {
            cell.text_label1.text = @"橡木桶成酿时间：No";
        }
        
        return cell;
    }
    else if(indexPath.section ==2)
    { 
       UITableViewCell *cell = nil;
        cell = [tableView dequeueReusableCellWithIdentifier:thirdReuseIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:windowReuseIdentifier];
        }
        cell.textLabel.font = [UIFont fontWithName:@"Marker Felt" size:18];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        if (indexPath.row == 0) {
            cell.textLabel.text = @"酒庄介绍";
        }
        else if(indexPath.row == 1)
        {
            cell.textLabel.text = @"产区介绍";
        }
        else if(indexPath.row == 2)
        {
            cell.textLabel.text = @"酿酒师介绍";
        }
        else
        {
            cell.textLabel.text = @"顾客评论";
        }
 
        return cell;
    }
    return nil;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    if (indexPath.section == 2) {

    }
}

-(void)tapGestureAction
{
    //进入购买的页面
}


//        AnimateCell *cell = (AnimateCell*)[tableView dequeueReusableCellWithIdentifier:thirdReuseIdentifier];
//        if (!cell) {
//            cell = [[AnimateCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:thirdReuseIdentifier];
//        }
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        cell.tag = indexPath.row;
//        if (indexPath.row == 0) {
//            cell.cellText.text = @"酒庄介绍";
//        }
//        else if(indexPath.row == 1)
//        {
//            cell.cellText.text = @"产区介绍";
//        }
//        else if(indexPath.row == 2)
//          {
//            cell.cellText.text = @"酿酒师介绍";
//        }
//        else
//        {
//            cell.cellText.text = @"顾客评论";
//        }
//        
//        if (self.expand) {
//            cell.enteredView.hidden = NO;
//        }
//        else
//        {
//            cell.enteredView.hidden = YES;
//        }
//        

@end
