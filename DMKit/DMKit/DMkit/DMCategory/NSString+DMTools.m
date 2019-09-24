//
//  NSString+DMTools.m
//  DMKit
//
//  Created by iMac-03 on 2017/12/29.
//  Copyright © 2017年 呆木. All rights reserved.
//

#import "NSString+DMTools.h"

#import <CommonCrypto/CommonDigest.h>   //md5 用到

#import "NSData+DMTools.h"
#import "NSObject+DMTools.h"


@implementation NSString (DMTools)

/// 是否为有效字符串 (是字符串类型 && 长度大于0)
- (BOOL)isStringWithLength
{
    if ([self isKindOfClass:[NSString class]] &&
        self.length > 0) {
        return YES;
    }
    return NO;
}

/// 是否为有效字符串 且 不能全是空格
- (BOOL)isStringWithoutAllSpace
{
    if ([self isStringWithLength]) {
        NSString *str = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
        if (str.length != 0) {
            return YES;
        }
    }
    return NO;
}

/// 是否为有效字符串 且 不能包含空格
- (BOOL)isStringWithoutSpace
{
    if ([self isStringWithLength]) {
        NSString *str = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
        if (str.length == self.length) {
            return YES;
        }
    }
    return NO;
}



- (BOOL)isEmail
{   //@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *emailRegex = @"^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (NSString *)pinyin
{
    NSMutableString *str = [self mutableCopy];
    CFStringTransform(( CFMutableStringRef)str, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform(( CFMutableStringRef)str, NULL, kCFStringTransformStripDiacritics, NO);
    
    return [str stringByReplacingOccurrencesOfString:@" " withString:@""];
}

#pragma mark - Hash

- (NSString *)md2
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return data.md2String;
}
- (NSString *)md4
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return data.md4String;
}
- (NSString *)md5
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return data.md5String;
}
- (NSString *)sha1
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return data.sha1String;
}
- (NSString *)sha224
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return data.sha224String;
}
- (NSString *)sha256
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return data.sha256String;
}
- (NSString *)sha384
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return data.sha384String;
}
- (NSString *)sha512
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return data.sha512String;
}

#pragma mark - Hmac

- (NSString *)hmacMD5StringWithKey:(NSString *)key
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [data hmacMD5StringWithKey:key];
}

- (NSString *)hmacSHA1StringWithKey:(NSString *)key
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [data hmacSHA1StringWithKey:key];
}

- (NSString *)hmacSHA224StringWithKey:(NSString *)key
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [data hmacSHA224StringWithKey:key];
}

- (NSString *)hmacSHA256StringWithKey:(NSString *)key
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [data hmacSHA256StringWithKey:key];
}

- (NSString *)hmacSHA384StringWithKey:(NSString *)key
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [data hmacSHA384StringWithKey:key];
}

- (NSString *)hmacSHA512StringWithKey:(NSString *)key
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [data hmacSHA512StringWithKey:key];
}


#pragma mark - aes


- (NSString *)aesEncryptWithKey:(NSString *)key IV:(NSString *)iv
{
    NSData *contentData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    NSData *ivData = [iv dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData *result = [contentData aesEncryptWithKey:keyData IV:ivData];
    
    return [result base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
}

- (NSString *)aesDecryptWithKey:(NSString *)key IV:(NSString *)iv
{
    NSData *contentData = [[NSData alloc] initWithBase64EncodedString:self options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    NSData *ivData = [iv dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData *result = [contentData aesDecryptWithKey:keyData IV:ivData];
    
    return [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
}

#pragma mark - Des

- (NSString *)desEncryptWithKey:(NSString *)key IV:(NSString *)iv
{
    NSData *contentData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    NSData *ivData = [iv dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData *result = [contentData desEncryptWithKey:keyData IV:ivData];
    
    return [result base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
}

- (NSString *)desDecryptWithKey:(NSString *)key IV:(NSString *)iv
{
    NSData *contentData = [[NSData alloc] initWithBase64EncodedString:self options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    NSData *ivData = [iv dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData *result = [contentData desDecryptWithKey:keyData IV:ivData];
    
    return [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
}

@end
