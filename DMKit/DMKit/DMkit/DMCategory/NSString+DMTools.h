//
//  NSString+DMTools.h
//  DMKit
//
//  Created by iMac-03 on 2017/12/29.
//  Copyright © 2017年 呆木. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DMTools)

/// 是否为有效字符串 (是字符串类型 && 长度大于0)
- (BOOL)isStringWithLength;  
/// 是否为有效字符串 且 不能全是空格
- (BOOL)isStringWithoutAllSpace;
/// 是否为有效字符串 且 不能包含空格
- (BOOL)isStringWithoutSpace;

- (BOOL)isEmail;

- (NSString *)pinyin;

#pragma mark - Hash

- (NSString *)md2;
- (NSString *)md4;
- (NSString *)md5;
- (NSString *)sha1;
- (NSString *)sha224;
- (NSString *)sha256;
- (NSString *)sha384;
- (NSString *)sha512;

#pragma mark - Hmac

- (NSString *)hmacMD5StringWithKey:(NSString *)key;

- (NSString *)hmacSHA1StringWithKey:(NSString *)key;

- (NSString *)hmacSHA224StringWithKey:(NSString *)key;

- (NSString *)hmacSHA256StringWithKey:(NSString *)key;

- (NSString *)hmacSHA384StringWithKey:(NSString *)key;

- (NSString *)hmacSHA512StringWithKey:(NSString *)key;


#pragma mark - Aes
/** 使用的是aes , 自动根据key长度计算aes128,aes192,aes256 , **iv长度推荐16位** , CBC加密模式 , 数据块128位 , 加密结果使用base64输出 */
- (NSString *)aesEncryptWithKey:(NSString *)key IV:(NSString *)iv;
/** 使用的是aes , 先解base64后解密 , 自动根据key长度计算aes128,aes192,aes256 , **iv长度推荐16位** , CBC加密模式 , 数据块128位 */
- (NSString *)aesDecryptWithKey:(NSString *)key IV:(NSString *)iv;


#pragma mark - Des
/** Des 加密 , 0<=key<=8,超过8位实际使用只有前8位 , 当iv长度 < 8的时候使用ecb(ecb不需要iv),其它使用cbc(就算长度大于了8位,实际使用只有前8位), */
- (NSString *)desEncryptWithKey:(NSString *)key IV:(NSString *)iv;
/** Des 解密 , 0<=key<=8,超过8位实际使用只有前8位 , 当iv长度 < 8的时候使用ecb(ecb不需要iv),其它使用cbc(就算长度大于了8位,实际使用只有前8位), */
- (NSString *)desDecryptWithKey:(NSString *)key IV:(NSString *)iv;


@end
