//
//  DMBaseAlertView.m
//  DMKit
//
//  Created by iMac-03 on 2019/9/6.
//  Copyright © 2019 呆木. All rights reserved.
//

#import "DMBaseAlertView.h"

#import "DMDefine.h"

#import <Masonry/Masonry.h>

@interface DMBaseAlertView ()

@end

@implementation DMBaseAlertView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds]) {
        [self dm_setupViews];
    }
    return self;
}

- (void)dm_setupViews
{
    _isHideWhenTouchBackground = YES;
    
    _bgView = [[UIControl alloc] initWithFrame:self.bounds];
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW * 0.8, kScreenH * 0.6)];
    
    [self addSubview:_bgView];
    [self addSubview:_contentView];
    
    _bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.35];
    _bgView.alpha = 0;
    [_bgView addTarget:self action:@selector(clickBackgroundView) forControlEvents:UIControlEventTouchUpInside];

    _contentView.center = CGPointMake(kScreenW/2, kScreenH/2);
    _contentView.backgroundColor = [UIColor whiteColor];
    _contentView.layer.cornerRadius = 6;
    _contentView.clipsToBounds = YES;
}

- (void)showAnimate:(BOOL)animate
{
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    [window addSubview:self];
    
    if (animate) {
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
        animation.duration = .25;
        NSMutableArray *values = [NSMutableArray array];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.05, 1.05, 1.0)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.95, 0.95, 1.0)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
        animation.values = values;
        [_contentView.layer addAnimation:animation forKey:nil];
    }
    
    [UIView animateWithDuration:.25 animations:^{
        self->_bgView.alpha = 1;
        self->_contentView.alpha = 1;
    }];
}

- (void)hide
{
    [UIView animateWithDuration:.25 animations:^{
        self->_bgView.alpha = 0;
        self->_contentView.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)clickBackgroundView
{
    [self endEditing:YES];
    
    if (_isHideWhenTouchBackground) {
        [self hide];
    }
}

- (void)changeContentSize:(CGSize)size
{
    _contentView.frame = CGRectMake((kGetW(self) - size.width) / 2.0,
                                    (kGetH(self) - size.height) / 2.0,
                                    size.width,
                                    size.height);
}

@end

