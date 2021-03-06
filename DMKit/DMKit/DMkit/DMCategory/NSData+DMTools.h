//
//  NSData+DMTools.h
//  DMKit
//
//  Created by iMac-03 on 2018/3/27.
//  Copyright © 2018年 呆木. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (DMTools)

#pragma mark - Hash

//hash  参考YYKit


/**
 Returns a lowercase NSString for md2 hash.
 */
- (NSString *)md2String;

/**
 Returns an NSData for md2 hash.
 */
- (NSData *)md2Data;

/**
 Returns a lowercase NSString for md4 hash.
 */
- (NSString *)md4String;

/**
 Returns an NSData for md4 hash.
 */
- (NSData *)md4Data;

/**
 Returns a lowercase NSString for md5 hash.
 */
- (NSString *)md5String;

/**
 Returns an NSData for md5 hash.
 */
- (NSData *)md5Data;

/**
 Returns a lowercase NSString for sha1 hash.
 */
- (NSString *)sha1String;

/**
 Returns an NSData for sha1 hash.
 */
- (NSData *)sha1Data;

/**
 Returns a lowercase NSString for sha224 hash.
 */
- (NSString *)sha224String;

/**
 Returns an NSData for sha224 hash.
 */
- (NSData *)sha224Data;

/**
 Returns a lowercase NSString for sha256 hash.
 */
- (NSString *)sha256String;

/**
 Returns an NSData for sha256 hash.
 */
- (NSData *)sha256Data;

/**
 Returns a lowercase NSString for sha384 hash.
 */
- (NSString *)sha384String;

/**
 Returns an NSData for sha384 hash.
 */
- (NSData *)sha384Data;

/**
 Returns a lowercase NSString for sha512 hash.
 */
- (NSString *)sha512String;

/**
 Returns an NSData for sha512 hash.
 */
- (NSData *)sha512Data;

#pragma mark - Hmac

/**
 Returns a lowercase NSString for hmac using algorithm md5 with key.
 @param key  The hmac key.
 */
- (NSString *)hmacMD5StringWithKey:(NSString *)key;

/**
 Returns an NSData for hmac using algorithm md5 with key.
 @param key  The hmac key.
 */
- (NSData *)hmacMD5DataWithKey:(NSData *)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha1 with key.
 @param key  The hmac key.
 */
- (NSString *)hmacSHA1StringWithKey:(NSString *)key;

/**
 Returns an NSData for hmac using algorithm sha1 with key.
 @param key  The hmac key.
 */
- (NSData *)hmacSHA1DataWithKey:(NSData *)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha224 with key.
 @param key  The hmac key.
 */
- (NSString *)hmacSHA224StringWithKey:(NSString *)key;

/**
 Returns an NSData for hmac using algorithm sha224 with key.
 @param key  The hmac key.
 */
- (NSData *)hmacSHA224DataWithKey:(NSData *)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha256 with key.
 @param key  The hmac key.
 */
- (NSString *)hmacSHA256StringWithKey:(NSString *)key;

/**
 Returns an NSData for hmac using algorithm sha256 with key.
 @param key  The hmac key.
 */
- (NSData *)hmacSHA256DataWithKey:(NSData *)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha384 with key.
 @param key  The hmac key.
 */
- (NSString *)hmacSHA384StringWithKey:(NSString *)key;

/**
 Returns an NSData for hmac using algorithm sha384 with key.
 @param key  The hmac key.
 */
- (NSData *)hmacSHA384DataWithKey:(NSData *)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha512 with key.
 @param key  The hmac key.
 */
- (NSString *)hmacSHA512StringWithKey:(NSString *)key;

/**
 Returns an NSData for hmac using algorithm sha512 with key.
 @param key  The hmac key.
 */
- (NSData *)hmacSHA512DataWithKey:(NSData *)key;


#pragma mark - Aes
/** 使用的是aes ,自动根据key长度计算aes128,aes192,aes256 **iv长度推荐16位** CBC加密模式, 数据块128位 */
- (NSData *)aesEncryptWithKey:(NSData *)key IV:(NSData *)iv;
/** 使用的是aes ,自动根据key长度计算aes128,aes192,aes256 **iv长度推荐16位** CBC加密模式, 数据块128位 */
- (NSData *)aesDecryptWithKey:(NSData *)key IV:(NSData *)iv;

#pragma mark - Des
/** Des 加密 , 0<=key<=8,超过8位实际使用只有前8位 , 当iv长度 < 8的时候使用ecb(ecb不需要iv),其它使用cbc(就算长度大于了8位,实际使用只有前8位), */
- (NSData *)desEncryptWithKey:(NSData *)key IV:(NSData *)iv;
/** Des 解密 , 0<=key<=8,超过8位实际使用只有前8位 , 当iv长度 < 8的时候使用ecb(ecb不需要iv),其它使用cbc(就算长度大于了8位,实际使用只有前8位), */
- (NSData *)desDecryptWithKey:(NSData *)key IV:(NSData *)iv;

@end
