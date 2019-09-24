//
//  UIViewController+DMTools.h
//  DMKit
//
//  Created by iMac-03 on 2017/12/5.
//  Copyright © 2017年 呆木. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (DMTools)

@property (nonatomic , assign) CGFloat navAlpha;

/// 将要销毁  (如果35秒后还未销毁,则疑似内存泄漏)
- (void)willDealloc;



// navbackgroundColor
//@property (null_resettable, nonatomic, strong) UIColor *navBarTintColor;

// tintColor
//@property (null_resettable, nonatomic, strong) UIColor *navTintColor;

// titleColor
//@property (null_resettable, nonatomic, strong) UIColor *navTitleColor;

@end
