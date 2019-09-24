//
//  DMWebView.h
//  DMKit
//
//  Created by iMac-03 on 17/9/8.
//  Copyright © 2017年 呆木. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMWebView : UIWebView

@property (nonatomic , assign , getter=isAutoFit) BOOL autoFit;     //默认yes

@property (nonatomic , copy) void (^didClickLink)(NSURL * link);

@property (nonatomic , copy) void (^didFinishHeight)(CGFloat height);

@end
