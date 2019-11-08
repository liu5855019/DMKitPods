//
//  DMPickerVC.h
//  DMKit
//
//  Created by iMac-03 on 2019/11/7.
//  Copyright © 2019 daimu. All rights reserved.
//

#import "DMBaseViewController.h"

@interface DMPickerVC : DMBaseViewController

@end

@interface PickerModel : NSObject

@property (nonatomic , copy) NSString *name;
@property (nonatomic , assign) NSInteger index;

+ (instancetype)modelWithName:(NSString *)name
                        index:(NSInteger)index;


@end
