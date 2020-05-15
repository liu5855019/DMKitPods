//
//  UIViewController+DMMBHud.m
//  DMKit
//
//  Created by iMac-03 on 2020/5/8.
//  Copyright © 2020 daimu. All rights reserved.
//


//#import "UIViewController+DMMBHud.h"
//
//#include <objc/runtime.h>
//
//static char *vcMBHudKey = "vcMBHudKey";
//
//@implementation UIViewController (DMMBHud)
//
//
//- (MBProgressHUD *)mbHud
//{
//    if (objc_getAssociatedObject(self, vcMBHudKey) == nil) {
//        
//        MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.view];
//        
//        [self.view addSubview:hud];
//        
//        objc_setAssociatedObject(self, vcMBHudKey, hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//        
//        return hud;
//    }
//    
//    return objc_getAssociatedObject(self, vcMBHudKey);
//}
//
//- (void)showHUD
//{
//    [self.view bringSubviewToFront:self.mbHud];
//    
//    [self.mbHud showAnimated:YES];
//}
//
//- (void)hideHUD
//{
//    [self.mbHud hideAnimated:YES];
//}
//
//@end

