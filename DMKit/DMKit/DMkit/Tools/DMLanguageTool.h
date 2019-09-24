//
//  DMLanguageTool.h
//  DMKit
//
//  Created by iMac-03 on 2017/10/10.
//  Copyright © 2017年 呆木. All rights reserved.
//

#import <Foundation/Foundation.h>

//#define kLocStr(key) [[DMLanguageTool sharedInstance] stringWithKey:key]

static NSString * const kUpdateLanguageNoti = @"kUpdateLanguageNoti";

typedef enum : NSUInteger {
    LT_DEFAULT,
    LT_ZH_HANS,
    LT_EN,
} LanguageType;


@interface DMLanguageTool : NSObject

@property (nonatomic , assign) LanguageType type;

+ (id)sharedInstance;

- (NSString *)stringWithKey:(NSString *)key;

@end

