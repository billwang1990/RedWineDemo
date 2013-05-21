//
//  FloatView.m
//  RedWineDemo
//
//  Created by niko on 13-5-19.
//  Copyright (c) 2013年 bill wang. All rights reserved.
//

#import "FloatView.h"

@interface FloatView()

@property (nonatomic) CGFloat halfwidth;
@property (nonatomic) CGFloat halfheight;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGRect mainRect;

@end

@implementation FloatView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UILabel *label = [[UILabel alloc]init];
        label.text = @"buy";
        [self addSubview:label];
        
        _tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapDetect)];
        _pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panDetect:)];
     
        [self addGestureRecognizer:_tap];
        [self addGestureRecognizer:_pan];
        self.backgroundColor = [UIColor clearColor];
        
        _width = frame.size.width;
        _height = frame.size.height;
        _halfheight = _height/2;
        _halfwidth = _width/2;
        
        
        _mainRect = [UIScreen mainScreen].applicationFrame;

    }
    return self;
}

-(id)initWithSize:(CGSize)viewSize
{
    _mainRect = [UIScreen mainScreen].applicationFrame;
    self = [super initWithFrame:CGRectMake((self.mainRect.size.width - viewSize.width), (self.mainRect.size.height - 130), viewSize.width, viewSize.height)];
    if (self) {
        UILabel *label = [[UILabel alloc]init];
        label.text = @"buy";
        [self addSubview:label];
        
        _tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapDetect)];
        _pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panDetect:)];
        
        [self addGestureRecognizer:_tap];
        [self addGestureRecognizer:_pan];
        self.backgroundColor = [UIColor clearColor];
        
        _width =  viewSize.width;
        _height =  viewSize.height;
        _halfheight = _height/2;
        _halfwidth = _width/2;
        
        
    }
    return self;
}

-(void)tapDetect
{
    [self.delegate tapGestureAction];
}

-(void)panDetect:(UIPanGestureRecognizer *)sender
{
    CGPoint center = self.center;
    CGPoint trans = [sender translationInView:self];
    
    [self setCenter:CGPointMake(center.x + trans.x, center.y + trans.y)];
    
    [sender setTranslation:CGPointZero inView:self];
    
    
    if (self.frame.origin.x < 0) {
        [self setCenter:CGPointMake(self.halfwidth, self.center.y)];
    }
    else if(self.frame.origin.x > (self.mainRect.size.width - self.width))
    {
        [self setCenter:CGPointMake(self.mainRect.size.width - self.halfwidth, self.center.y)];
    }
    
    if (self.frame.origin.y < 0) {
        [self setCenter:CGPointMake(self.center.x,self.halfheight)];
    }
    else if(self.frame.origin.y > (self.mainRect.size.height - 130))
    {
        [self setCenter:CGPointMake(self.center.x, self.mainRect.size.height - 130)];
    }
}

@end
