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

- (UILabel *)vcTitleLab
{
    if (_vcTitleLab == nil) {
        _vcTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenW*0.6, 30)];
        _vcTitleLab.textAlignment = NSTextAlignmentCenter;
        _vcTitleLab.text = @"";
        _vcTitleLab.textColor = [UIColor blackColor];
        _vcTitleLab.font = [UIFont boldSystemFontOfSize:21];
        
        self.navigationItem.titleView = _vcTitleLab;
    }
    return _vcTitleLab;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
