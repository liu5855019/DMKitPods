//
//  UIView+DMTools.m
//  DMKit
//
//  Created by iMac-03 on 2017/12/29.
//  Copyright © 2017年 呆木. All rights reserved.
//

#import "UIView+DMTools.h"
#import "DMDefine.h"

@implementation UIView (DMTools)

#pragma mark - << setter/getter >>

- (CGFloat)x
{
    return self.frame.origin.x;
}
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}
- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}
- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}
- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGFloat)centerX
{
    return self.center.x;
}
- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}
- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}


#pragma mark - << blockSet >>

/** 根据类名加载xib ---> View */
+ (__kindof UIView *) viewWithXibClassName:(NSString *)className
{
    return [[NSBundle mainBundle] loadNibNamed:className owner:nil options:nil][0];
}

/** 增加默认阴影 */
- (void)addBCShaadow
{
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderWidth = 1;
    self.layer.shadowColor = [UIColor colorWithRed:74/255.0f green:112/255.0f blue:189/255.0f alpha:1.0].CGColor;
    self.layer.shadowRadius = 5;
    self.layer.shadowOpacity = 0.25;
    self.layer.shadowOffset = CGSizeMake(-2, 2);
    self.clipsToBounds = false;
}

/** 增加指定颜色阴影 */
- (void)addBCShaadowWith:(UIColor *)color
{
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = 1;
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowRadius = 5;
    self.layer.shadowOpacity = 0.25;
    self.layer.shadowOffset = CGSizeMake(-2, 2);
    self.clipsToBounds = false;
}


/** 增加带圆角指定颜色阴影 */
- (void)addCornerShadowWith:(UIColor *)color
{
    [self addCornerShadowWith:color hasBorder:NO];
}

- (void)addCornerShadowWith:(UIColor *)color hasBorder:(BOOL)hasBorder
{
    if (hasBorder) {
        self.layer.borderColor = color.CGColor;
        self.layer.borderWidth = kLineH;
    }
    
    self.backgroundColor = [UIColor whiteColor];
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowRadius = 5;
    self.layer.shadowOpacity = 0.3;
    self.layer.shadowOffset = CGSizeMake(0, 0);
    self.layer.cornerRadius = 6;
}

@end
