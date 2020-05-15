//
//  UIViewController+DMMBHud.h
//  DMKit
//
//  Created by iMac-03 on 2020/5/8.
//  Copyright © 2020 daimu. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>


@interface UIViewController (DMMBHud)

@property (nonatomic , strong , readonly) MBProgressHUD *mbHud;
- (void)showHUD;
- (void)hideHUD;

@end

