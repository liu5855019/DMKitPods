//
//  DMDatePickerVC.m
//  DMKit
//
//  Created by iMac-03 on 2019/11/7.
//  Copyright © 2019 daimu. All rights reserved.
//

#import "DMDatePickerVC.h"

#import "DMKit.h"

@interface DMDatePickerVC () <UITableViewDataSource , UITableViewDelegate>

@property (nonatomic , strong) DMDatePickerView *picker;
@property (nonatomic , strong) DMDatePickerView *customPicker;

@property (nonatomic , strong) UITableView *tabV;
@property (nonatomic , copy) NSArray *datas;

@end

@implementation DMDatePickerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.vcTitleLab.text = @"Test for DMDatePicker";
    
    [self.view addSubview:self.tabV];
    
    _datas = @[
        @"Show Picker",
        @"Show Custom Picker",
        @"Init Picker Show",
        @"Init Custom Picker Show",
        @"Init Picker Custom TimeFormat"
    ];
    
}



#pragma mark - TableView
- (UITableView *)tabV
{
    if (_tabV == nil) {
        _tabV = [[UITableView alloc] initWithFrame:CGRectMake(0, kNAV_HEIGHT, kScreenW, kScreenH - kNAV_HEIGHT - kSAFE_BOTTOM_HEIGHT) style:UITableViewStylePlain];
        AdjustsScrollViewInsetNever(self, _tabV);
        
        _tabV.delegate = self;
        _tabV.dataSource = self;
        _tabV.estimatedRowHeight = 60;
        _tabV.rowHeight = UITableViewAutomaticDimension;
        _tabV.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _tabV;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [_datas dm_objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        [self showPicker];
    } else if (indexPath.row == 1) {
        [self showCustomPicker];
    } else if (indexPath.row == 2) {
        [self pickerShow];
    } else if (indexPath.row == 3) {
        [self customPickerShow];
    } else if (indexPath.row == 4) {
        [self pickerCustomTimeFormat];
    }

}


#pragma mark - Picker

- (DMDatePickerView *)picker
{
    if (_picker == nil) {
        _picker = [DMDatePickerView pickerWithBlock:^(NSDate *date) {
            [DMTools showToastAtWindow:[date stringWithFormat:yyyyMMddHHmmss]];
        }];
    }
    return _picker;
}

- (DMDatePickerView *)customPicker
{
    if (_customPicker == nil) {
        _customPicker = [DMDatePickerView pickerWithDate:[[NSDate date] dateByAddingTimeInterval:123456]
                                               sureTitle:@"OK"
                                             cancelTitle:@"Exit"
                                               sureColor:nil
                                             cancelColor:kRandomColor
                                              timeFormat:yyyyMMdd
                                                   block:^(NSDate *date) {
            [DMTools showToastAtWindow:[date stringWithFormat:yyyyMMddHHmmss]];
        }];
    }
    return _customPicker;
}

- (void)showPicker
{
    [DMDatePickerView showWithBlock:^(NSDate *date) {
        [DMTools showToastAtWindow:[date stringWithFormat:yyyyMMddHHmmss]];
    }];
}

- (void)showCustomPicker
{
    [DMDatePickerView showWithDate:[[NSDate date] dateByAddingTimeInterval:-123456]
                         sureTitle:@"Sure"
                       cancelTitle:@"Hide"
                         sureColor:kRandomColor
                       cancelColor:kRandomColor
                        timeFormat:yyyyMMddHHmmss
                             block:^(NSDate *date) {
        [DMTools showToastAtWindow:[date stringWithFormat:yyyyMMddHHmmss]];
    }];
}

- (void)pickerShow
{
    [self.picker show];
}

- (void)customPickerShow
{
    [self.customPicker show];
}

- (void)pickerCustomTimeFormat
{
    self.picker.timeFormat = yyyyMMddHHmmss;
    
    [self.picker show];
}





@end
