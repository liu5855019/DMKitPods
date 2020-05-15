//
//  UIView+DMTools.h
//  DMKit
//
//  Created by iMac-03 on 2017/12/29.
//  Copyright © 2017年 呆木. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DMTools)

#pragma mark - <<Setter / Getter>>
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;


/** 根据类名加载xib ---> View */
+ (__kindof UIView *)viewWithXibClassName:(NSString *)className;

/** 增加默认阴影 */
- (void)addBCShaadow;

/** 增加指定颜色阴影 */
- (void)addBCShaadowWith:(UIColor *)color;

/** 增加带圆角指定颜色阴影 */
- (void)addCornerShadowWith:(UIColor *)color;
- (void)addCornerShadowWith:(UIColor *)color hasBorder:(BOOL)hasBorder;


@end
