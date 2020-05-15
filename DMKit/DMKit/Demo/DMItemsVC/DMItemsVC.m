//
//  DMItemsVC.m
//  DMKit
//
//  Created by iMac-03 on 2020/5/15.
//  Copyright © 2020 daimu. All rights reserved.
//

#import "DMItemsVC.h"
#import "DMItemsView.h"
#import "DMDefine.h"

@interface DMItemsVC ()

@property (nonatomic, strong) DMItemsView *itemsV;

@end

@implementation DMItemsVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.itemsV];
}

- (DMItemsView *)itemsV
{
    if (_itemsV == nil) {
        NSArray *datas = @[
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
            @{
                @"title":@"考勤签到",
            },
        ];
        
        _itemsV = [[DMItemsView alloc] initWithFrame:self.view.bounds numberOfLines:10 numberOfItemsInLine:10 titleFont:17 datas:datas didClickButton:^(NSInteger index) {
            NSLog(@"%ld",index);
        }];
    }
    return  _itemsV;
}



@end
