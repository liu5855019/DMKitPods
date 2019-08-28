//
//  DMKit.h
//  DMKit
//
//  Created by iMac-03 on 2019/8/27.
//  Copyright © 2019 daimu. All rights reserved.
//

#import <UIKit/UIKit.h>


#if __has_include(<DMKit/DMKit.h>)

//Tools
#import <DMKit/DMDefine.h>
#import <DMKit/DMTools.h>
#import <DMKit/DMLanguageTool.h>
#import <DMKit/ImagePickerTool.h>
#import <DMKit/LocationTool.h>

// Base
#import <DMKit/DMBaseNavigationController.h>

// Category
#import <DMKit/NSArray+DMTools.h>
#import <DMKit/UIViewController+DMTools.h>
#import <DMKit/UINavigationBar+DMTools.h>




#else //------------------------------------------//


// Tools
#import "DMDefine.h"
#import "DMTools.h"
#import "DMLanguageTool.h"
#import "ImagePickerTool.h"
#import "LocationTool.h"

// Base
#import "DMBaseNavigationController.h"

// Category
#import "NSArray+DMTools.h"
#import "UIViewController+DMTools.h"
#import "UINavigationBar+DMTools.h"




#endif

