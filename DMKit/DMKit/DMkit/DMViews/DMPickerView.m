//
//  DMPickerView.m
//  DMKit
//
//  Created by iMac-03 on 2019/11/7.
//  Copyright © 2019 daimu. All rights reserved.
//

#import "DMPickerView.h"

#import "DMDefine.h"
#import "UIView+DMTools.h"
#import "NSArray+DMTools.h"

@interface DMPickerView () <UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic , strong) UIColor *sureColor;
@property (nonatomic , strong) UIColor *cancelColor;
@property (nonatomic , copy) NSString *sureTitle;
@property (nonatomic , copy) NSString *cancelTitle;

@end

@implementation DMPickerView

#pragma mark - Init

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds]) {
        [self setupViews];
    }
    return self;
}

+ (instancetype)pickerWithBlock:(void (^)(NSInteger, id))block
{
    return [[self alloc] initWithBlock:block];
}

+ (instancetype)pickerWithDatas:(NSArray *)datas key:(NSString *)key block:(void (^)(NSInteger, id))block
{
    return [[self alloc] initWithDatas:datas key:key block:block];
}

+ (instancetype)pickerWithDatas:(NSArray *)datas key:(NSString *)key sureTitle:(NSString *)sureTitle cancelTitle:(NSString *)cancelTitle sureColor:(UIColor *)sureColor cancelColor:(UIColor *)cancelColor block:(void (^)(NSInteger, id))block
{
    return [[self alloc] initWithDatas:datas key:key sureTitle:sureTitle cancelTitle:cancelTitle sureColor:sureColor cancelColor:cancelColor block:block];
}


- (instancetype)initWithBlock:(void (^)(NSInteger, id))block
{
    return [self initWithDatas:nil key:nil block:block];
}

- (instancetype)initWithDatas:(NSArray *)datas
                          key:(NSString *)key
                        block:(void (^)(NSInteger, id))block
{
    return [self initWithDatas:datas
                           key:key
                     sureTitle:nil
                   cancelTitle:nil
                     sureColor:nil
                   cancelColor:nil
                         block:block];
}

- (instancetype)initWithDatas:(NSArray *)datas
                          key:(NSString *)key
                    sureTitle:(NSString *)sureTitle
                  cancelTitle:(NSString *)cancelTitle
                    sureColor:(UIColor *)sureColor
                  cancelColor:(UIColor *)cancelColor
                        block:(void (^)(NSInteger, id))block
{
    _datas = datas;
    _key = key;
    _sureTitle = sureTitle;
    _sureColor = sureColor;
    _cancelTitle = cancelTitle;
    _cancelColor = cancelColor;
    self.didSelectedBlock = block;
    
    return [self init];
}

#pragma mark - Setup

- (void)setupViews
{
    self.backgroundColor = kGetColorRGBA(0, 0, 0, 0.25);
    self.alpha = 0;
    
    CGFloat kBtnBgH = 45;
    CGFloat kPickerH = 216;
    
    _operateView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenH, kScreenW, kSAFE_BOTTOM_HEIGHT + kBtnBgH + kPickerH)];
    _operateView.backgroundColor = [UIColor whiteColor];
    _operateView.layer.cornerRadius = 6;
    _operateView.clipsToBounds = YES;
    [self addSubview:_operateView];
    
    //垂直分割线
    UILabel *leftVerticalLine = [[UILabel alloc] initWithFrame:CGRectMake(_operateView.width / 4, 0, kLineH, 45)];
    leftVerticalLine.backgroundColor = [UIColor lightGrayColor];
    leftVerticalLine.alpha = 0.5;
    [_operateView addSubview:leftVerticalLine];

    //垂直分割线
    UILabel *rightVerticalLine = [[UILabel alloc] initWithFrame:CGRectMake(_operateView.width / 4 * 3, 0, kLineH, 45)];
    rightVerticalLine.backgroundColor = [UIColor lightGrayColor];
    rightVerticalLine.alpha = 0.5;
    [_operateView addSubview:rightVerticalLine];

    //水平分割线
    UILabel *horizontalLine = [[UILabel alloc] initWithFrame:CGRectMake(0, 45, _operateView.width, kLineH)];
    horizontalLine.backgroundColor = [UIColor lightGrayColor];
    horizontalLine.alpha = 0.5;
    [_operateView addSubview:horizontalLine];
    
    // cancel btn
    _cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, _operateView.width / 4, 45)];
    [_operateView addSubview:_cancelBtn];
    [_cancelBtn setTitle:self.cancelTitle forState:UIControlStateNormal];
    [_cancelBtn setTitleColor:self.cancelColor forState:UIControlStateNormal];
    _cancelBtn.titleLabel.font = kFont(17);
    [_cancelBtn addTarget:self action:@selector(clickCancelBtn) forControlEvents:UIControlEventTouchUpInside];
    
    // sureBtn
    _sureBtn = [[UIButton alloc] initWithFrame:CGRectMake(_operateView.width / 4 * 3, 0, _operateView.width / 4, 45)];
    [_operateView addSubview:_sureBtn];
    [_sureBtn setTitle:self.sureTitle forState:UIControlStateNormal];
    [_sureBtn setTitleColor:self.sureColor forState:UIControlStateNormal];
    _sureBtn.titleLabel.font = kFont(17);
    [_sureBtn addTarget:self action:@selector(clickSureBtn) forControlEvents:UIControlEventTouchUpInside];
    
    // content Lab
    _contentLab = [[UILabel alloc] initWithFrame:CGRectMake(_operateView.width / 4, 0, _operateView.width / 4 * 2, 45)];
    [_operateView addSubview:_contentLab];
    _contentLab.textAlignment = NSTextAlignmentCenter;
    _contentLab.textColor = [UIColor grayColor];
    _contentLab.font = kFont(17);
    
    // picker
    _picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, kBtnBgH, _operateView.width, kPickerH)];
    [_operateView addSubview:_picker];
    _picker.delegate = self;
    _picker.dataSource = self;
    
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

#pragma mark - hidden && show

- (void)show
{
    self.hidden = NO;
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    NSInteger row = [_picker selectedRowInComponent:0];
    _contentLab.text = [self titleForRow:row];
    
    [UIView animateWithDuration:0.25f animations:^{
        self.alpha = 1;
        self.operateView.y = kScreenH - self.operateView.height;
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

#pragma mark - Delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _datas.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self titleForRow:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _contentLab.text = [self titleForRow:row];
}

- (NSString *)titleForRow:(NSInteger)row
{
    NSString *str = [_datas dm_objectAtIndex:row];
    
    if ([str isKindOfClass:[NSString class]]) {
        return str;
    }
    
    if (_key) {
        NSString *value = [str valueForKey:_key];
        if ([value isKindOfClass:[NSString class]]) {
            return value;
        }
    }
    
    return @"";
}

#pragma mark - Actions

- (void)setDatas:(NSArray *)datas
{
    _datas = [datas copy];
    [self.picker reloadAllComponents];
}

- (void)setKey:(NSString *)key
{
    _key = [_key copy];
    [self.picker reloadAllComponents];
}

- (void)updateDatas:(NSArray *)datas withKey:(NSString *)key
{
    _key = key;
    _datas = datas;
    [self.picker reloadAllComponents];
}

- (void)clickSureBtn
{
    if (_didSelectedBlock) {
        if (_datas.count) {
            NSInteger index = [_picker selectedRowInComponent:0];
            _didSelectedBlock(index , _datas[index]);
        }
    }
    [self hide];
}

- (void)clickCancelBtn
{
    [self hide];
}

- (void)dealloc
{
    MyLog(@" Game Over ... ");
}


@end

