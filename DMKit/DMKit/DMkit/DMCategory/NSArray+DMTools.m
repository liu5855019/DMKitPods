//
//  NSArray+DMTools.m
//  DMKit
//
//  Created by iMac-03 on 2017/12/8.
//  Copyright © 2017年 呆木. All rights reserved.
//

#import "NSArray+DMTools.h"

@implementation NSArray (DMTools)

- (id)dm_firstObject
{
    return [self dm_objectAtIndex:0];
}

- (id)dm_lastObject
{
    return [self dm_objectAtIndex:self.count-1];
}

- (id)dm_objectAtIndex:(NSInteger)index
{
    if (index >= self.count || index < 0) {
        return nil;
    }
    return [self objectAtIndex:index];
}

- (BOOL)dm_hasString:(NSString *)string
{
    for (NSString *string1 in self) {
        if ([string isEqualToString:string1]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)dm_hasObject:(NSObject *)object
{
    for (NSObject *obj in self) {
        if (obj == object) {
            return YES;
        }
    }
    return NO;
}


/** 归类函数:返回归类排序结果 block:用于类似通讯录的排序 */
- (NSMutableArray *)classifyWithKey:(NSString *)key block:(void (^)(NSMutableArray *keys , NSMutableArray *valueArrays))block
{
    // 生成归类的keys
    NSMutableArray *muKeys = [NSMutableArray array];
    for (id object in self) {
        NSString *classifyKey = [object valueForKey:key];
        if (classifyKey &&
            [classifyKey isKindOfClass:[NSString class]] &&
            ![muKeys dm_hasString:classifyKey]) {
            [muKeys addObject:classifyKey];
        }
    }
    
    NSMutableArray *muValueArrays = [NSMutableArray array];
    NSMutableArray *result = [NSMutableArray array];
    for (NSString *classifyKey in muKeys) {
        NSMutableArray *muValues = [NSMutableArray array];
        for (id object in self) {
            NSString *classifyKey1 = [object valueForKey:key];
            if ([classifyKey1 isEqualToString:classifyKey]) {
                [muValues addObject:object];
            }
        }
        [muValueArrays addObject:muValues];
        [result addObjectsFromArray:muValues];
    }
    
    if (block) {
        block(muKeys , muValueArrays);
    }
    return result;
}


@end
