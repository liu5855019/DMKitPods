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

@property (nonatomic , strong) UIView *btnBgView;
@property (nonatomic , strong) UIButton *sureBtn;
@property (nonatomic , strong) UIButton *cancelBtn;



@property (nonatomic , copy) NSString *key;     ///< key path
@property (nonatomic , copy) NSArray *datas;    ///< 数据 (datas可以不是string,当不是string的时候必须要给key)


@property (nonatomic , copy) void (^didSelectedIndex)(NSInteger index , id obj);


/// (datas可以不是string,当不是string的时候必须要给key)
- (void)updateDatas:(NSArray *)datas withKey:(NSString *)key;

- (void)show;
- (void)hide;

@end
