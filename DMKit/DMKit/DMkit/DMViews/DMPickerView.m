//
//  DMPickerView.m
//  DMKit
//
//  Created by iMac-03 on 2019/11/7.
//  Copyright © 2019 daimu. All rights reserved.
//

#import "DMPickerView.h"

#import "DMDefine.h"

#import <Masonry/Masonry.h>


@interface DMPickerView () <UIPickerViewDelegate,UIPickerViewDataSource>
{
    CGRect _pickerUpRect;
    CGRect _pickerDownRect;
    
    CGRect _btnBgUpRect;
    CGRect _btnBgDownRect;
}

@property (nonatomic , strong) id currentValue;     ///< 选中的值

@end

@implementation DMPickerView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds]) {
        self.backgroundColor = kGetColorRGBA(0, 0, 0, 0.15);
        
        CGFloat kBtnBgH = kScaleW(40);
        CGFloat kPickerH = 216;
        
        _pickerUpRect = CGRectMake(0, kScreenH - kPickerH, kScreenW, kPickerH);
        _pickerDownRect = CGRectMake(0, kScreenH + kBtnBgH, kScreenW, kPickerH);
       
        _btnBgUpRect = CGRectMake(0, kScreenH - kPickerH - kBtnBgH, kScreenW, kBtnBgH);
        _btnBgDownRect = CGRectMake(0, kScreenH, kScreenW, kBtnBgH);
        
        
        _picker = [[UIPickerView alloc] initWithFrame:_pickerDownRect];
        [self addSubview:_picker];

        _picker.backgroundColor = [UIColor whiteColor];
        self.picker.delegate = self;
        self.picker.dataSource = self;
               
        [self createBtns];
    }
    return self;
}

- (void)createBtns
{
    _btnBgView = [UIView new];
    _sureBtn = [UIButton new];
    _cancelBtn = [UIButton new];
    
    [self addSubview:_btnBgView];
    [_btnBgView addSubview:_sureBtn];
    [_btnBgView addSubview:_cancelBtn];
    
    
    _btnBgView.backgroundColor = [UIColor whiteColor];
    _btnBgView.frame = _btnBgDownRect;
    
    [_sureBtn setTitle:@"Done" forState:UIControlStateNormal];
    [_sureBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _sureBtn.titleLabel.font = kFont(kScaleW(15));
    [_sureBtn addTarget:self action:@selector(clickSureBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [_cancelBtn setTitle:@"Cancel" forState:UIControlStateNormal];
    [_cancelBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    _cancelBtn.titleLabel.font = kFont(kScaleW(15));
    [_cancelBtn addTarget:self action:@selector(clickCancelBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [_sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(kScaleW(-10));
        make.centerY.mas_equalTo(0);
        make.width.mas_equalTo(kScaleW(80));
        make.height.mas_equalTo(kScaleW(38));
    }];
    
    [_cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(kScaleW(10));
        make.centerY.mas_equalTo(0);
        make.width.mas_equalTo(kScaleW(80));
        make.height.mas_equalTo(kScaleW(38));
    }];
}

#pragma mark - hidden && show

- (void)setHidden:(BOOL)hidden
{
    if (hidden) {
        [self hide];
    }else{
        [self show];
    }
}

- (void)show
{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
//    [self.superview bringSubviewToFront:self];
    WeakObj(self);
    [UIView animateWithDuration:0.3 animations:^{
        selfWeak.picker.frame = self->_pickerUpRect;
        selfWeak.btnBgView.frame = self->_btnBgUpRect;
    }];
}

- (void)hide
{
    WeakObj(self);

    [UIView animateWithDuration:0.3 animations:^{
        selfWeak.picker.frame = self->_pickerDownRect;
        selfWeak.btnBgView.frame = self->_btnBgDownRect;
    } completion:^(BOOL finished) {
        [selfWeak removeFromSuperview];
    }];
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
    NSString *str = _datas[row];
    
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
    if (_didSelectedIndex) {
        if (_datas.count) {
            NSInteger index = [_picker selectedRowInComponent:0];
            _didSelectedIndex(index,_datas[index]);
        }
    }
    [self hide];
}

- (void)clickCancelBtn
{
    [self hide];
}


@end

