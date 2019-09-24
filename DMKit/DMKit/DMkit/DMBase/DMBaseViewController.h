//
//  DMBaseViewController.h
//  DMKit
//
//  Created by iMac-03 on 17/3/6.
//  Copyright © 2017年 呆木. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface DMBaseViewController : UIViewController

@property (nonatomic , strong) UILabel *titleLab;

@property (nonatomic , strong) MBProgressHUD * mbHud;
- (void)showHUD;
- (void)hideHUD;

@end
