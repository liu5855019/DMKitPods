//
//  DMKit.h
//  DMKit
//
//  Created by iMac-03 on 2019/8/27.
//  Copyright © 2019 呆木. All rights reserved.
//

#import <UIKit/UIKit.h>


//#if __has_include(<DMKit/DMKit.h>)
//
//
//#else //------------------------------------------//
//
//
//#endif


extern NSString *DMKitVersion;



// Version : 2.0.0  //由于本次改动较大, 版本号直接上2
/**
 去掉 AFNetWorking 的引用
 去掉 Toast 的引用
 去掉 MBProgressHUD 的引用
 
 DMTools 中修改一些命令,更加好用,更加规范
 DMTools 去掉 Toast 相关
 加入 DMTools+DMCopyToast ,用的时候直接新建文件 DMTools+DMToast, 代码全篇copy过去就好
 
 修改 DMLanguageTool ,更加全面好用
 
 删除 DMWebView , 由于 UIWebView 被苹果禁用,所以删除
 
 将 DMBaseViewController 中的 mbHud 移到 UIViewController+DMCopyMBHud 中
 由继承改为 UIViewController 的类别
 如果要用mbHud的时候直接 copy UIViewController+DMCopyMBHud 就好
 
 Views
 DMItemsView >> DMCopyItemsView   引用了(Masonry,SDWebImage)
 DMSegmentView >> DMCopySegmentView
 DMShadowView >> DMCopyShadowView
 DMWKWebView >> DMCopyWKWebView
*/


// Version : 1.3.0 (online)
// 修改 项目 标记
// 修改 DMPickerView
// 修改 DMDatePickerView


// Tools
#import "DMDefine.h"
#import "DMTools.h"
#import "DMLanguageTool.h"
#import "ImagePickerTool.h"
#import "LocationTool.h"

// Base
#import "DMBaseViewController.h"
#import "DMBaseNavigationController.h"

// Category
#import "NSArray+DMTools.h"
#import "UIViewController+DMTools.h"
#import "UINavigationBar+DMTools.h"
#import "CADisplayLink+DMTools.h"
#import "NSData+DMTools.h"
#import "NSDate+DMTools.h"
#import "NSObject+DMTools.h"
#import "NSString+DMTools.h"
#import "UIColor+DMTools.h"
#import "UIImage+DMTools.h"
#import "UIView+DMTools.h"

// View
#import "DMBaseAlertView.h"
#import "DMPickerView.h"
#import "DMDatePickerView.h"
#import "DMSegmentView.h"
#import "DMShowBigImageView.h"

