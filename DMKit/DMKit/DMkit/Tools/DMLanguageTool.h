//
//  DMLanguageTool.h
//  DMKit
//
//  Created by iMac-03 on 2017/10/10.
//  Copyright © 2017年 呆木. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kLocStr(key) [[DMLanguageTool sharedInstance] stringWithKey:key]

static NSString * const kUpdateLanguageNoti = @"kUpdateLanguageNoti";

typedef enum : NSUInteger {
    LT_DEFAULT,
    LT_ZH_HANS,     ///< 简体中文
    LT_EN,          ///< 英语
} LanguageType;


/** 国际化使用 : app内切换 */
@interface DMLanguageTool : NSObject

@property (nonatomic , assign) LanguageType type;
@property (nonatomic , strong , readonly) NSString *typeStr;

+ (instancetype)sharedInstance;

- (NSString *)stringWithKey:(NSString *)key;

/** type 对应的字符 */
+ (NSString *)stringWithType:(LanguageType)type;

+ (BOOL)isEenglish;

/** 根据 Language Type 自动生成 locale */
+ (NSLocale *)locale;

@end

