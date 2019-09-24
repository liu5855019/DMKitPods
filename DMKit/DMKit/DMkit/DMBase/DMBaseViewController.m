//
//  DMBaseViewController.m
//  DMKit
//
//  Created by iMac-03 on 17/3/6.
//  Copyright © 2017年 呆木. All rights reserved.
//

#import "DMBaseViewController.h"

#import "DMDefine.h"

@interface DMBaseViewController ()


@end

@implementation DMBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (UILabel *)titleLab
{
    if (_titleLab == nil) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenW*0.6, 30)];
        _titleLab.textAlignment = NSTextAlignmentCenter;
        _titleLab.text = @"";
        _titleLab.textColor = [UIColor blackColor];
        _titleLab.font = [UIFont boldSystemFontOfSize:21];
        
        self.navigationItem.titleView = _titleLab;
    }
    return _titleLab;
}

#pragma mark - MBHud
- (MBProgressHUD *)mbHud
{
    if (_mbHud == nil) {
        _mbHud = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:_mbHud];
    }
    return _mbHud;
}

- (void)showHUD
{
    [self.view bringSubviewToFront:self.mbHud];
    
    [self.mbHud showAnimated:YES];
}

- (void)hideHUD
{
    [self.mbHud hideAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
