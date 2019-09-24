//
//  DMDatePickerView.h
//  DMKit
//
//  Created by iMac-03 on 17/1/14.
//  Copyright © 2017年 呆木. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMDatePickerView : UIView

@property (nonatomic, strong) UIView *operateView;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIDatePicker *timePicker;

@property (nonatomic , copy) void (^sureBlock)(NSDate *date);

- (void)show;

- (void)hide;

- (instancetype)initWithDate:(NSDate *)date block:(void (^)(NSDate *date))block;

+ (DMDatePickerView *)pickerWithDate:(NSDate *)date block:(void (^)(NSDate *date))block;

+ (DMDatePickerView *)showWithDate:(NSDate *)date block:(void (^)(NSDate *date))block;

@end
