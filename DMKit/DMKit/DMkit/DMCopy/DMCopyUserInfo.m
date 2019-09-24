//
//  Userid.m
//  DMKit
//
//  Created by iMac-03 on 16/6/30.
//  Copyright © 2016年 呆木. All rights reserved.
//


//
//#import "UserInfo.h"
//
//#import "DMDefine.h"
//
//static NSString * const kUserInfo = @"kUserInfo";
//
//
//@interface UserInfo ()
//
//@end
//
//
//@implementation UserInfo
//
//+ (instancetype)shareUser
//{
//    static UserInfo *userInfo;
//    if (userInfo) {
//        return userInfo;
//    }
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        NSString *filePath = [DMTools filePathInDocuntsWithFile:kUserInfo];
//        userInfo = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
//
//        if (!userInfo) {
//            userInfo = [[self alloc] init];
//        }
//    });
//
//    return userInfo;
//}
//
//- (void)saveDatas
//{
//    NSString *filePath = [DMTools filePathInDocuntsWithFile:kUserInfo];
//
//    [NSKeyedArchiver archiveRootObject:self toFile:filePath];
//}
//
//- (void)removeDatas
//{
//    //删除归档的文件
//    NSString *filePath = [DMTools filePathInDocuntsWithFile:kUserInfo];
//    [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
//}
//
//#pragma mark - NSCoding
//
////  解档协议方法
//- (instancetype)initWithCoder:(NSCoder *)coder
//{
//    self = [super init];
//    if (self) {
//        self.oldUserName = [coder decodeObjectForKey:@"oldUserName"];
//    }
//    return self;
//}
//
//
////  归档协议方法
//- (void)encodeWithCoder:(NSCoder *)aCoder
//{
//    [aCoder encodeObject:self.oldUserName forKey:@"oldUserName"];
//}
//
//
//@end

