//
//  DMScreen.h
//  DMKit
//
//  Created by iMac-03 on 2019/8/28.
//  Copyright © 2019 呆木. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface DMScreen : NSObject

+ (instancetype)shareInstance;

//屏幕比例 根据6/6s/7的屏幕计算屏幕比例 配合DMDefine使用
- (CGFloat)screenScaleH;
- (CGFloat)screenScaleW;

@end



