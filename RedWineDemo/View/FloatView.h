//
//  FloatView.h
//  RedWineDemo
//
//  Created by niko on 13-5-19.
//  Copyright (c) 2013年 bill wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FloatViewDelegate <NSObject>

-(void)tapGestureAction;

@end

@interface FloatView : UIView<UIGestureRecognizerDelegate>

@property (nonatomic, weak) id<FloatViewDelegate> delegate;
@property (nonatomic) UITapGestureRecognizer *tap;
@property (nonatomic) UIPanGestureRecognizer  *pan;

-(id)initWithSize:(CGSize)viewSize;

@end
