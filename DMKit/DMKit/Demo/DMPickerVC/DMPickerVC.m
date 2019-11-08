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

@property (nonatomic , strong) DMPickerView *stringPicker;
@property (nonatomic , strong) DMPickerView *modelPicker;

@end

@implementation DMPickerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.vcTitleLab.text = @"Test for DMPickerView";
    
    [self.view addSubview:self.tabV];
    
    
    _datas = @[
        @"Show String Picker",
        @"Show Model Picker"
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
    
    if (indexPath.row == 0) {
        [self.stringPicker updateDatas:@[@"title 1",@"title 2",@"title 3"] withKey:nil];
        [self.stringPicker show];
    } else if (indexPath.row == 1) {
        [self.modelPicker show];
    }
}

#pragma mark - picker

- (DMPickerView *)stringPicker
{
    if (_stringPicker == nil) {
        _stringPicker = [[DMPickerView alloc] initWithBlock:^(NSInteger index, id obj) {
            [DMTools showToastAtWindow:obj];
        }];
    }
    return _stringPicker;
}

- (DMPickerView *)modelPicker
{
    if (_modelPicker == nil) {
        _modelPicker =
        [DMPickerView pickerWithDatas:@[
                [PickerModel modelWithName:@"model 0" index:0],
                [PickerModel modelWithName:@"model 1" index:1],
                [PickerModel modelWithName:@"model 2" index:2],
                [PickerModel modelWithName:@"model 3" index:3],
                [PickerModel modelWithName:@"model 4" index:4],
                [PickerModel modelWithName:@"model 5" index:5],
                [PickerModel modelWithName:@"model 6" index:6] ]
                                  key:@"name"
                            sureTitle:@"Sure"
                          cancelTitle:nil
                            sureColor:nil
                          cancelColor:kRandomColor
                                block:^(NSInteger index, id obj) {
            PickerModel *model = obj;
            [DMTools showToastAtWindow:model.name];
        }];
    }
    return _modelPicker;
}

@end




@implementation PickerModel

+ (instancetype)modelWithName:(NSString *)name index:(NSInteger)index
{
    PickerModel *model = [[PickerModel alloc] init];
    model.name = name;
    model.index = index;
    return model;
}

@end






