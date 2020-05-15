//
//  NSArray+DMTools.h
//  DMKit
//
//  Created by iMac-03 on 2017/12/8.
//  Copyright © 2017年 呆木. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (DMTools)

- (id)dm_firstObject;
- (id)dm_lastObject;

- (id)dm_objectAtIndex:(NSInteger)index;

- (BOOL)dm_hasString:(NSString *)string;
- (BOOL)dm_hasObject:(NSObject *)object;

/** 归类函数:返回归类排序结果 block:用于类似通讯录的排序 */
- (NSMutableArray *)classifyWithKey:(NSString *)key block:(void (^)(NSMutableArray *keys , NSMutableArray *valueArrays))block;




@end
