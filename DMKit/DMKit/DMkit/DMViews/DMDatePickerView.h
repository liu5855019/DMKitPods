//
//  DMDatePickerView.h
//  DMKit
//
//  Created by iMac-03 on 17/1/14.
//  Copyright © 2017年 呆木. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMDatePickerView : UIView

@property (nonatomic , strong ) UIDatePicker *timePicker;

@property (nonatomic , strong , readonly) UIView *operateView;
@property (nonatomic , strong , readonly) UILabel *timeLabel;
@property (nonatomic , strong , readonly) UIButton *sureBtn;
@property (nonatomic , strong , readonly) UIButton *cancelBtn;
@property (nonatomic , copy) NSString *timeFormat;      ///< 用来显示所选的time的格式 默认:"yyyy/MM/dd HH:mm"

@property (nonatomic , copy) void (^sureBlock)(NSDate *date);

- (void)show;
- (void)hide;

#pragma mark - Init

- (instancetype)initWithBlock:(void (^)(NSDate *date))block;

- (instancetype)initWithDate:(NSDate *)date
                       block:(void (^)(NSDate *date))block;

- (instancetype)initWithDate:(NSDate *)date
                   sureTitle:(NSString *)sureTitle
                 cancelTitle:(NSString *)cancelTitle
                   sureColor:(UIColor *)sureColor
                 cancelColor:(UIColor *)cancelColor
                  timeFormat:(NSString *)timeFormat
                       block:(void (^)(NSDate *date))block;



+ (DMDatePickerView *)pickerWithBlock:(void (^)(NSDate * date))block;

+ (DMDatePickerView *)pickerWithDate:(NSDate *)date
                               block:(void (^)(NSDate * date))block;

+ (DMDatePickerView *)pickerWithDate:(NSDate *)date
                           sureTitle:(NSString *)sureTitle
                         cancelTitle:(NSString *)cancelTitle
                           sureColor:(UIColor *)sureColor
                         cancelColor:(UIColor *)cancelColor
                          timeFormat:(NSString *)timeFormat
                               block:(void (^)(NSDate *date))block;


+ (DMDatePickerView *)showWithBlock:(void (^)(NSDate * date))block;

+ (DMDatePickerView *)showWithDate:(NSDate *)date
                             block:(void (^)(NSDate * date))block;

+ (DMDatePickerView *)showWithDate:(NSDate *)date
                         sureTitle:(NSString *)sureTitle
                       cancelTitle:(NSString *)cancelTitle
                         sureColor:(UIColor *)sureColor
                       cancelColor:(UIColor *)cancelColor
                        timeFormat:(NSString *)timeFormat
                             block:(void (^)(NSDate *date))block;



@end
