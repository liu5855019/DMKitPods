//
//  DMBaseAlertView.h
//  DMKit
//
//  Created by iMac-03 on 2019/9/6.
//  Copyright © 2019 呆木. All rights reserved.
//

#import <UIKit/UIKit.h>


/** 弹出 全屏背景&内容不全屏 的 View
 *
 * contentView : 把要显示的View 添加到这个view上
 * changeContentSize : 修改contentView的size
 *
 */

@interface DMBaseAlertView : UIView

@property (nonatomic , strong , readonly) UIView *contentView;
@property (nonatomic , strong , readonly) UIControl *bgView;

@property (nonatomic , assign) BOOL isHideWhenTouchBackground;  // default : Yes

- (void)showAnimate:(BOOL)animate;
- (void)hide;

- (void)changeContentSize:(CGSize)size;

@end

