//
//  DMCopyNet.h
//  DMKit
//
//  Created by iMac-03 on 2019/8/27.
//  Copyright © 2019 呆木. All rights reserved.
//
//
//#import <Foundation/Foundation.h>
//
//#import <AFNetworking/AFNetworking.h>
//
//@interface DMCopyNet : NSObject
//
//
////Ajax--post提交
///** 重用afn的post  请将代码copy到一个新的类里使用 */
//+ (void)postWithUrl:(NSString *)url
//               para:(id)para
//            success:(void (^)(id responseObject))success
//            failure:(void(^)(NSError *error))failure;
//
///** 直接获取info 用于特定项目(项目中主要返回值内容全都跟在message里,并且是json型字符串) */
//+ (void)postWithUrl:(NSString *)url
//               para:(id)para
//               info:(void (^)(id info))infomation
//            failure:(void(^)(NSError *error))failure;
//
////Form表单提交, 模仿afn用法
//+ (void)postFormWithUrl:(NSString *)url
//                   para:(id)para
//                success:(void (^)(id responseObject))success
//                failure:(void(^)(NSError *error))failure;
//
///** 直接获取message 用于特定项目*/
//+ (void)postFormWithUrl:(NSString *)url
//                   para:(id)para
//                   info:(void (^)(id info))infomation
//                failure:(void(^)(NSError *error))failure;
//
//
///** 重用afn的get */
//+ (void)getWithUrl:(NSString *)url
//              para:(id)para
//           success:(void (^)(id responseObject))success
//           failure:(void(^)(NSError *error))failure;
///** 直接获取message 用于特定项目 */
//+ (void)getWithUrl:(NSString *)url
//              para:(id)para
//              info:(void (^)(id info))infomation
//           failure:(void(^)(NSError *error))failure;
//
//
///**
// *  请求SOAP，返回NSData
// *
// *  @param url      请求地址
// *  @param soapBody soap的XML中方法和参数段
// *  @param success  成功block
// *  @param failure  失败block
// */
//+ (void)SOAPData:(NSString *)url
//        funcName:(NSString *)funcName
//        soapBody:(NSString *)soapBody
//         success:(void (^)(id responseObject))success
//         failure:(void(^)(NSError *error))failure;
//
//
//
//
//@end


