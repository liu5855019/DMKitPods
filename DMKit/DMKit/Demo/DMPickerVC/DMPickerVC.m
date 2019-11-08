//
//  DMPickerVC.m
//  DMKit
//
//  Created by iMac-03 on 2019/11/7.
//  Copyright © 2019 daimu. All rights reserved.
//

#import "DMPickerVC.h"

#import "DMKit.h"

@interface DMPickerVC () <UITableViewDelegate , UITableViewDataSource>

@property (nonatomic , strong) UITableView *tabV;

@property (nonatomic , strong) NSArray *datas;

@property (nonatomic , strong) DMPickerView *picker;

@end

@implementation DMPickerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.vcTitleLab.text = @"Test for DMPickerView";
    
    [self.view addSubview:self.tabV];
    
    
    _datas = @[
        @"Show picker",
        @"Show picker 1"
    ];
}



#pragma mark - TableView
- (UITableView *)tabV{
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
    
    [self.picker updateDatas:@[@"title 1",@"title 2",@"title 3"] withKey:nil];
    
    [self.picker show];
}

#pragma mark - picker

- (DMPickerView *)picker
{
    if (_picker == nil) {
        _picker = [[DMPickerView alloc] init];
        
        
    }
    return _picker;
}



@end
