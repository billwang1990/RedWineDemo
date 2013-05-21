//
//  Home.m
//  RedWineDemo
//
//  Created by xyhh on 13-5-15.
//  Copyright (c) 2013年 bill wang. All rights reserved.
//

#import "Home.h"
#import "head.h"
#import "TableCell.h"
#import "FloatView.h"

static CGFloat ImageHeight  = 180.0;
static CGFloat ImageWidth  = 320.0;

@interface Home ()<FloatViewDelegate>

@property (nonatomic) FloatView *floatView;

@end

@implementation Home


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


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    CGRect bounds = self.view.bounds;
    self.tableview.frame = bounds;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    /*
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:@"scan" style:UIBarButtonItemStylePlain target:self action:@selector(scanBar)];
    
    self.navigationItem.rightBarButtonItem = right;
    */
    
    //set the tint colour of the navigation bar as usual (setting it to a deep red here)
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:initialRed/255.0f green:initialGreen/255.0f blue:initialBlue/255.0f alpha:1.0f];
    
    UIImage *image = [UIImage imageNamed:@"wine.png"];
    self.image = [[UIImageView alloc] initWithImage:image];
    self.image.frame = CGRectMake(0, 0, ImageWidth, ImageHeight);
    
    self.title = @"GORRITI";


    self.tableview = [[UITableView alloc] init];
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleSingleLine;

    self.tableview.backgroundColor = [UIColor clearColor];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    
    [self.view addSubview:self.tableview];
    [self.view addSubview:self.image];
    self.floatView = [[FloatView alloc]initWithFrame:CGRectMake(0, 0, 38, 38)];
    
    
    self.floatView.delegate = self;
    UIImageView *shoppingcar = [[UIImageView alloc]initWithFrame:self.floatView.frame];
    [shoppingcar setImage:[UIImage imageNamed:@"shopcar.png"]];

    [self.floatView addSubview:shoppingcar];
    [self.view addSubview:self.floatView];
}


-(void)tapGestureAction{
    NSLog(@"tap action");
}

#pragma mark - Table View Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self updateImg];
}

#pragma mark - Table View Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0)
		return 1;
	else
		return 4;
	
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0)
		return ImageHeight;
    else
		return 28.0;
	
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellReuseIdentifier   = @"mycell";
    NSString *windowReuseIdentifier = @"SectionOneCell";
    
    if (indexPath.section == 0) {
        
        UITableViewCell *cell = nil;
        cell = [tableView dequeueReusableCellWithIdentifier:windowReuseIdentifier];
        if (!cell) {
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:windowReuseIdentifier];
        }
        return cell;
    } else {
        
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
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
