//
//  DMTools+DMCopyToast.h
//  DMKit
//
//  Created by iMac-03 on 2020/5/8.
//  Copyright © 2020 daimu. All rights reserved.
//


#import "DMTools.h"

@interface DMTools (DMToast)

/** 在window上显示toast */
+ (void)showToastAtWindowFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);

/** 在window上显示toast */
+ (void)showToastAtWindow:(NSString *)content;

/** 在window上显示toast */
+ (void)showToastAtWindow:(NSString *)content duration:(NSTimeInterval)time position:(id)obj;

@end
