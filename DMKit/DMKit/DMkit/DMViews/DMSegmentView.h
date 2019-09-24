//
//  DMSegmentView.h
//  DMKit
//
//  Created by iMac-03 on 2017/12/18.
//  Copyright © 2017年 呆木. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMSegmentView : UIView

/** frame&views 必填   其他非必填 */
- (instancetype)initWithFrame:(CGRect)frame
                        views:(NSArray <UIView *> *)views
                       titles:(NSArray <NSString *>*)titles
                    titleFont:(UIFont *)font
                   titleColor:(UIColor *)titleColor
           titleSelectedColor:(UIColor *)selectedColor
              titlesIsAverage:(BOOL)isAve
                   showAction:(void(^)(NSInteger index))showAction;



@property (nonatomic , strong) UIScrollView *headerScroll;

- (UIButton *)buttonWithTag:(NSInteger)tag;

@end
