//
//  DMBasePickerView.h
//  DMKit
//
//  Created by iMac-03 on 2018/3/13.
//  Copyright © 2018年 呆木. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMBasePickerView : UIView

@property (nonatomic , strong) UIPickerView *picker;

- (instancetype)initWithBGView:(UIView *)view;

- (instancetype)initWithBGView:(UIView *)view isHasBtn:(BOOL)hasBtn;

- (void)show;

- (void)hide;

@property (nonatomic , copy) void (^hideAction)(void);

@end
