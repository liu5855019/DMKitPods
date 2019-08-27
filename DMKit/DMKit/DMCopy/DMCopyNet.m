//
//  DMCopyNet.m
//  DMKit
//
//  Created by iMac-03 on 2019/8/27.
//  Copyright © 2019 daimu. All rights reserved.
//
//
//#import "DMCopyNet.h"
//
//#import "DMDefine.h"
//
//@implementation DMCopyNet
//
//
////Ajax--post提交
///** 重用afn的post */
//+ (void)postWithUrl:(NSString *)url
//               para:(id)para
//            success:(void (^)(id responseObject))success
//            failure:(void(^)(NSError *error))failure
//{
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//
//    [manager POST:url parameters:para progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//        NSError *error;
//        // 得到字典
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
//
//        if (error)
//        {
//            NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//            MAIN(^{
//                if (success) {
//                    success(result);
//                }
//            });
//        }
//        else
//        {
//            MAIN(^{
//                if (success) {
//                    success(dict);
//                }
//            });
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        MAIN(^{
//            if (failure) {
//                failure(error);
//            }
//        });
//    }];
//}
//
///** 直接获取info 用于特定项目(项目中主要返回值内容全都跟在message里,并且是json型字符串) */
//+ (void)postWithUrl:(NSString *)url
//               para:(id)para
//               info:(void (^)(id info))infomation
//            failure:(void(^)(NSError *error))failure
//{
//    [self postWithUrl:url para:para success:^(id responseObject) {
//        NSLog(@"%@",responseObject);
//        if (![responseObject isKindOfClass:[NSDictionary class]]) {
//            if (infomation) {
//                infomation(nil);
//            }
//            return ;
//        }
//        NSInteger state = [responseObject[@"status"] integerValue];
//        if (state == 200) {
//            NSString *infoStr = responseObject[@"message"];
//            infoStr = [infoStr stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
//            infoStr = [infoStr stringByReplacingOccurrencesOfString:@"\r" withString:@"\\r"];
//            NSDictionary *info = [self getDictOrArrayFromJsonStr:infoStr];
//            if (infomation) {
//                infomation(info);
//            }
//        }else{
//            if (infomation) {
//                infomation(responseObject[@"message"]);
//            }
//        }
//    } failure:^(NSError *error) {
//        if (failure) {
//            failure(error);
//        }
//    }];
//}
//
////Form表单提交, 模仿afn用法
//+ (void)postFormWithUrl:(NSString *)url
//                   para:(id)para
//                success:(void (^)(id responseObject))success
//                failure:(void(^)(NSError *error))failure
//{
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//
//    [manager POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        for (NSString *key in para) {
//            id object = [para valueForKey:key];
//
//            if ([object isKindOfClass:[NSString class]]) {
//                [formData appendPartWithFormData:[object dataUsingEncoding:NSUTF8StringEncoding] name:key];
//            }else if ([object isKindOfClass:[NSNumber class]]){
//                [formData appendPartWithFormData:[[object stringValue] dataUsingEncoding:NSUTF8StringEncoding] name:key];
//            }else{
//
//            }
//        }
//    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSError *error;
//        // 得到字典
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
//
//        if (error)
//        {
//            NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//            MAIN(^{
//                if (success) {
//                    success(result);
//                }
//            });
//        }
//        else
//        {
//            MAIN(^{
//                if (success) {
//                    success(dict);
//                }
//            });
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        MAIN(^{
//            if (failure) {
//                failure(error);
//            }
//        });
//    }];
//}
//
///** 直接获取message 用于特定项目*/
//+ (void)postFormWithUrl:(NSString *)url
//                   para:(id)para
//                   info:(void (^)(id info))infomation
//                failure:(void(^)(NSError *error))failure
//{
//    [self postFormWithUrl:url para:para success:^(id responseObject) {
//        NSLog(@"%@",responseObject);
//        if (![responseObject isKindOfClass:[NSDictionary class]]) {
//            if (infomation) {
//                infomation(nil);
//            }
//            return ;
//        }
//        NSInteger state = [responseObject[@"status"] integerValue];
//        if (state == 200) {
//            NSString *infoStr = responseObject[@"message"];
//            infoStr = [infoStr stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
//            infoStr = [infoStr stringByReplacingOccurrencesOfString:@"\r" withString:@"\\r"];
//            NSDictionary *info = [self getDictOrArrayFromJsonStr:infoStr];
//            if (infomation) {
//                infomation(info);
//            }
//        }else{
//            if (infomation) {
//                infomation(responseObject[@"message"]);
//            }
//        }
//    } failure:^(NSError *error) {
//        if (failure) {
//            failure(error);
//        }
//    }];
//}
//
//
///** 重用afn的get */
//+ (void)getWithUrl:(NSString *)url
//              para:(id)para
//           success:(void (^)(id responseObject))success
//           failure:(void(^)(NSError *error))failure
//{
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//
//    [manager GET:url parameters:para progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//        NSError *error;
//        // 得到字典
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
//
//        if (error)
//        {
//            NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//            MAIN(^{
//                if (success) {
//                    success(result);
//                }
//            });
//        }
//        else
//        {
//            MAIN(^{
//                if (success) {
//                    success(dict);
//                }
//            });
//        }
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        MAIN(^{
//            if (failure) {
//                failure(error);
//            }
//        });
//    }];
//}
///** 直接获取message 用于特定项目 */
//+ (void)getWithUrl:(NSString *)url
//              para:(id)para
//              info:(void (^)(id info))infomation
//           failure:(void(^)(NSError *error))failure
//{
//    [self getWithUrl:url para:para success:^(id responseObject) {
//        NSLog(@"%@",responseObject);
//        if (![responseObject isKindOfClass:[NSDictionary class]]) {
//            if (infomation) {
//                infomation(nil);
//            }
//            return ;
//        }
//        NSInteger state = [responseObject[@"status"] integerValue];
//        if (state == 200) {
//            NSString *infoStr = responseObject[@"message"];
//            infoStr = [infoStr stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
//            infoStr = [infoStr stringByReplacingOccurrencesOfString:@"\r" withString:@"\\r"];
//            NSDictionary *info = [self getDictOrArrayFromJsonStr:infoStr];
//            if (infomation) {
//                infomation(info);
//            }
//        }else{
//            if (infomation) {
//                infomation(responseObject[@"message"]);
//            }
//        }
//    } failure:^(NSError *error) {
//        if (failure) {
//            failure(error);
//        }
//    }];
//}
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
//         failure:(void(^)(NSError *error))failure
//{
//    //    NSString *soapStr1 = [NSString stringWithFormat:
//    //                         @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\
//    //                         <soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\"\
//    //                         xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\
//    //                         <soap:Header>\
//    //                         </soap:Header>\
//    //                         <soap:Body>%@</soap:Body>\
//    //                         </soap:Envelope>",soapBody];
//
//    NSString *soapStr = [NSString stringWithFormat:
//                         @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\"           \
//                         xmlns:q0=\"http://webservice.test.org/\"          \
//                         xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\"    \
//                         xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"> \
//                         <soapenv:Body>                                    \
//                         <q0:%@>                                           \
//                         <arg0>%@</arg0>                                   \
//                         </q0:%@>                                          \
//                         </soapenv:Body>                                   \
//                         </soapenv:Envelope>",
//                         funcName,soapBody,funcName
//                         ];
//
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
//
//    // 设置请求超时时间
//    manager.requestSerializer.timeoutInterval = 30;
//
//    // 返回NSData
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//
//    // 设置请求头，也可以不设置
//    [manager.requestSerializer setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//    [manager.requestSerializer setValue:[NSString stringWithFormat:@"%zd", soapStr.length] forHTTPHeaderField:@"Content-Length"];
//
//    // 设置HTTPBody
//    [manager.requestSerializer setQueryStringSerializationWithBlock:^NSString *(NSURLRequest *request, NSDictionary *parameters, NSError *__autoreleasing *error) {
//        return soapStr;
//    }];
//
//
//    [manager POST:url parameters:soapStr progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        // 把返回的二进制数据转为字符串
//        NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//
//        // 利用正则表达式取出<return></return>之间的字符串
//        NSRegularExpression *regular = [[NSRegularExpression alloc] initWithPattern:@"(?<=return\\>).*(?=</return)" options:NSRegularExpressionCaseInsensitive error:nil];
//
//        NSDictionary *dict = [NSDictionary dictionary];
//        for (NSTextCheckingResult *checkingResult in [regular matchesInString:result options:0 range:NSMakeRange(0, result.length)]) {
//
//            NSError *error;
//            // 得到字典
//            dict = [NSJSONSerialization JSONObjectWithData:[[result substringWithRange:checkingResult.range] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:&error];
//
//            if (error) {
//                dict = (NSDictionary*)[result substringWithRange:checkingResult.range];
//            }
//
//        }
//        // 请求成功并且结果有值把结果传出去
//        MAIN(^{
//            if (success) {
//                success(dict);
//            }
//        });
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        MAIN(^{
//            if (failure) {
//                failure(error);
//            }
//        });
//    }];
//}
//
//
//@end
