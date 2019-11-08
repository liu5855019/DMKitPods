//
//  DMPickerView.h
//  DMKit
//
//  Created by iMac-03 on 2019/11/7.
//  Copyright © 2019 daimu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMPickerView : UIView

@property (nonatomic , strong) UIPickerView *picker;

@property (nonatomic , strong , readonly) UIView *operateView;
@property (nonatomic , strong , readonly) UILabel *contentLab;
@property (nonatomic , strong , readonly) UIButton *sureBtn;
@property (nonatomic , strong , readonly) UIButton *cancelBtn;


@property (nonatomic , copy) NSString *key;     ///< key path
@property (nonatomic , copy) NSArray *datas;    ///< 数据 (datas可以不是string,当不是string的时候必须要给key)

@property (nonatomic , copy) void (^didSelectedBlock)(NSInteger index , id obj);


/// (datas可以不是string , 当不是string的时候必须要给key)
- (void)updateDatas:(NSArray *)datas withKey:(NSString *)key;

- (void)show;
- (void)hide;


#pragma mark - Init

- (instancetype)initWithBlock:(void (^)(NSInteger index , id obj))block;

- (instancetype)initWithDatas:(NSArray *)datas
                          key:(NSString *)key
                        block:(void (^)(NSInteger index , id obj))block;

- (instancetype)initWithDatas:(NSArray *)datas
                          key:(NSString *)key
                    sureTitle:(NSString *)sureTitle
                  cancelTitle:(NSString *)cancelTitle
                    sureColor:(UIColor *)sureColor
                  cancelColor:(UIColor *)cancelColor
                        block:(void (^)(NSInteger index , id obj))block;


+ (instancetype)pickerWithBlock:(void (^)(NSInteger index , id obj))block;

+ (instancetype)pickerWithDatas:(NSArray *)datas
                            key:(NSString *)key
                          block:(void (^)(NSInteger index , id obj))block;

+ (instancetype)pickerWithDatas:(NSArray *)datas
                            key:(NSString *)key
                      sureTitle:(NSString *)sureTitle
                    cancelTitle:(NSString *)cancelTitle
                      sureColor:(UIColor *)sureColor
                    cancelColor:(UIColor *)cancelColor
                          block:(void (^)(NSInteger index , id obj))block;

@end
