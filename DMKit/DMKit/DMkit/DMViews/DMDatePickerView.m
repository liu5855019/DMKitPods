//
//  DMDatePickerView.m
//  DMKit
//
//  Created by iMac-03 on 17/1/14.
//  Copyright © 2017年 呆木. All rights reserved.
//

#import "DMDatePickerView.h"


#import "DMDefine.h"
#import "NSDate+DMTools.h"
#import "UIView+DMTools.h"

@interface DMDatePickerView ()

@property (nonatomic , strong) UIColor *sureColor;
@property (nonatomic , strong) UIColor *cancelColor;
@property (nonatomic , copy) NSString *sureTitle;
@property (nonatomic , copy) NSString *cancelTitle;

@end

@implementation DMDatePickerView

#pragma mark - Init

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds]) {
        [self setupViews];
    }
    return self;
}


+ (DMDatePickerView *)showWithBlock:(void (^)(NSDate *))block
{
    DMDatePickerView *aView = [self pickerWithBlock:block];
    [aView show];
    return aView;
}

+ (DMDatePickerView *)showWithDate:(NSDate *)date block:(void (^)(NSDate * _Nonnull))block
{
    DMDatePickerView *aView = [self pickerWithDate:date block:block];
    [aView show];
    return aView;
}

+ (DMDatePickerView *)showWithDate:(NSDate *)date
                         sureTitle:(NSString *)sureTitle
                       cancelTitle:(NSString *)cancelTitle
                         sureColor:(UIColor *)sureColor
                       cancelColor:(UIColor *)cancelColor
                        timeFormat:(NSString *)timeFormat
                             block:(void (^)(NSDate *))block
{
    DMDatePickerView *aView = [self pickerWithDate:date
                                         sureTitle:sureTitle
                                       cancelTitle:cancelTitle
                                         sureColor:sureColor
                                       cancelColor:cancelColor
                                        timeFormat:timeFormat
                                             block:block];
    [aView show];
    return aView;
}


+ (DMDatePickerView *)pickerWithBlock:(void (^)(NSDate *))block
{
    return [[self alloc] initWithBlock:block];
}

+ (DMDatePickerView *)pickerWithDate:(NSDate *)date block:(void (^)(NSDate *))block
{
    return [[self alloc] initWithDate:date block:block];
}

+ (DMDatePickerView *)pickerWithDate:(NSDate *)date
                           sureTitle:(NSString *)sureTitle
                         cancelTitle:(NSString *)cancelTitle
                           sureColor:(UIColor *)sureColor
                         cancelColor:(UIColor *)cancelColor
                          timeFormat:(NSString *)timeFormat
                               block:(void (^)(NSDate *))block
{
    return [[self alloc] initWithDate:date
                            sureTitle:sureTitle
                          cancelTitle:cancelTitle
                            sureColor:sureColor
                          cancelColor:cancelColor
                           timeFormat:timeFormat
                                block:block];
}


- (instancetype)initWithBlock:(void (^)(NSDate *))block
{
    return [self initWithDate:nil block:block];
}

- (instancetype)initWithDate:(NSDate *)date
                       block:(void (^)(NSDate *))block
{
    return [self initWithDate:date
                    sureTitle:nil
                  cancelTitle:nil
                    sureColor:nil
                  cancelColor:nil
                   timeFormat:nil
                        block:block];
}

- (instancetype)initWithDate:(NSDate *)date
                   sureTitle:(NSString *)sureTitle
                 cancelTitle:(NSString *)cancelTitle
                   sureColor:(UIColor *)sureColor
                 cancelColor:(UIColor *)cancelColor
                  timeFormat:(NSString *)timeFormat
                       block:(void (^)(NSDate *))block
{
    NSDate *aDate = date ? date : [NSDate date];
    
    self.timePicker.date = aDate;
    _sureTitle = sureTitle;
    _sureColor = sureColor;
    _cancelTitle = cancelTitle;
    _cancelColor = cancelColor;
    _timeFormat = timeFormat;
    _sureBlock = block;
        
    return [self init];
}

#pragma mark - Setup

- (void)setupViews
{
    self.backgroundColor = kGetColorRGBA(0, 0, 0, 0.25);
    self.alpha = 0;
    
    UIView *operateView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenH, kScreenW, kSAFE_BOTTOM_HEIGHT + 226)];
    operateView.backgroundColor = [UIColor whiteColor];
    operateView.layer.cornerRadius = 6;
    operateView.clipsToBounds = YES;
    [self addSubview:operateView];
    
    //垂直分割线
    UILabel *leftVerticalLine = [[UILabel alloc] initWithFrame:CGRectMake(operateView.frame.size.width / 4, 0, kLineH, 45)];
    leftVerticalLine.backgroundColor = [UIColor lightGrayColor];
    leftVerticalLine.alpha = 0.5;
    [operateView addSubview:leftVerticalLine];

    //垂直分割线
    UILabel *rightVerticalLine = [[UILabel alloc] initWithFrame:CGRectMake(operateView.frame.size.width / 4 * 3, 0, kLineH, 45)];
    rightVerticalLine.backgroundColor = [UIColor lightGrayColor];
    rightVerticalLine.alpha = 0.5;
    [operateView addSubview:rightVerticalLine];

    //水平分割线
    UILabel *horizontalLine = [[UILabel alloc] initWithFrame:CGRectMake(0, 45, operateView.frame.size.width, kLineH)];
    horizontalLine.backgroundColor = [UIColor lightGrayColor];
    horizontalLine.alpha = 0.5;
    [operateView addSubview:horizontalLine];
    
    // cancel btn
    _cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, operateView.frame.size.width / 4, 45)];
    [operateView addSubview:_cancelBtn];
    [_cancelBtn setTitle:self.cancelTitle forState:UIControlStateNormal];
    [_cancelBtn setTitleColor:self.cancelColor forState:UIControlStateNormal];
    _cancelBtn.titleLabel.font = kFont(17);
    [_cancelBtn addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    
    // sureBtn
    _sureBtn = [[UIButton alloc] initWithFrame:CGRectMake(operateView.frame.size.width / 4 * 3, 0, operateView.frame.size.width / 4, 45)];
    [operateView addSubview:_sureBtn];
    [_sureBtn setTitle:self.sureTitle forState:UIControlStateNormal];
    [_sureBtn setTitleColor:self.sureColor forState:UIControlStateNormal];
    _sureBtn.titleLabel.font = kFont(17);
    [_sureBtn addTarget:self action:@selector(confirmAction) forControlEvents:UIControlEventTouchUpInside];
    

    _timeLab = [[UILabel alloc] initWithFrame:CGRectMake(operateView.frame.size.width / 4, 0, operateView.frame.size.width / 4 * 2, 45)];
    [operateView addSubview:_timeLab];
    _timeLab.textAlignment = NSTextAlignmentCenter;
    _timeLab.textColor = [UIColor grayColor];
    _timeLab.font = kFont(17);
    
    
    [operateView addSubview:self.timePicker];
    
    _operateView = operateView;
}


- (UIDatePicker *)timePicker
{
    if (!_timePicker) {
        _timePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 46, kScreenW, 162)];
        [_timePicker addTarget:self action:@selector(datePickerChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _timePicker;
}

- (NSString *)sureTitle
{
    if (_sureTitle == nil) {
        _sureTitle = @"Confirm";
    }
    return _sureTitle;
}

- (NSString *)cancelTitle
{
    if (_cancelTitle == nil) {
        _cancelTitle = @"Cancel";
    }
    return _cancelTitle;
}

- (UIColor *)sureColor
{
    if (_sureColor == nil) {
        _sureColor = kGetColorRGB(0, 122, 255);
    }
    return _sureColor;
}

- (UIColor *)cancelColor
{
    if (_cancelColor == nil) {
        _cancelColor = kGetColorRGB(0, 122, 255);
    }
    return _cancelColor;
}

- (NSString *)timeFormat
{
    if (_timeFormat == nil) {
        _timeFormat = yyyyMMddHHmm;
    }
    return _timeFormat;
}

#pragma mark - Actions

- (void)show
{
    self.hidden = NO;
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    _timeLab.text = [_timePicker.date stringWithFormat:self.timeFormat];
    
    [UIView animateWithDuration:0.25f animations:^{
        self.alpha = 1;
        self.operateView.y = kScreenH - (kSAFE_BOTTOM_HEIGHT + 226);
    } completion:^(BOOL finished) {

    }];
}

/**
 当时间选择器正在滚动的时候进行了 hide,
 1. 如果 这时候调用了 removeFromSuperview
    则会造成 UIControlEventValueChanged 不会触发,
    这时再次show: picker.date 与 picker界面上展示的时间会不同步
 2. 如果 hide 中不调用 removeFromSuperview
    则会造成内存泄漏, self 永远不会释放
 
 于是有了下面的写法
 */
- (void)hide
{
    [UIView animateWithDuration:0.25f animations:^{
        self.alpha = 0.0f;
        self.operateView.y = kScreenH;
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
    
    [self performSelector:@selector(remove) withObject:nil afterDelay:10];
}

- (void)remove
{
    if (self.hidden) {
        [self removeFromSuperview];
    }
}

- (void)datePickerChange:(UIDatePicker *)sender
{
    _timeLab.text = [sender.date stringWithFormat:self.timeFormat];
}

- (void)cancelAction
{
    [self hide];
}

- (void)confirmAction
{
    if (_sureBlock) {
        _sureBlock(_timePicker.date);
    }
    [self hide];
}

- (void)dealloc
{
    MyLog(@" Game Over ... ");
}


@end
