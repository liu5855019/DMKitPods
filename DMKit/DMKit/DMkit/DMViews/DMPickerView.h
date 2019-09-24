//
//  DMPickerView.h
//  DMKit
//
//  Created by iMac-03 on 2018/3/13.
//  Copyright © 2018年 呆木. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DMBasePickerView.h"

@interface DMPickerView : DMBasePickerView

@property (nonatomic , copy) NSArray <NSString *>*datas;

@property (nonatomic , copy) void (^didSelectedIndex)(NSInteger index);

@property (nonatomic , copy) void (^viewWillHide)(void);

@end
