//
//  NSObject+DMTools.m
//  DMKit
//
//  Created by 西安旺豆电子信息有限公司 on 2018/1/23.
//  Copyright © 2018年 呆木出品. All rights reserved.
//

#import "NSObject+DMTools.h"

@implementation NSObject (DMTools)


/// 非NSNull的 obj
- (BOOL)isObject;
{
    return [self isKindOfClass:[NSNull class]] ? NO : YES;
}


@end
