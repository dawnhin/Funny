//
//  HttpTool.m
//  Funny
//
//  Created by 黎铭轩 on 23/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import "HttpTool.h"
#import <AFNetworking/AFNetworking.h>
@implementation HttpTool
+(void)get:(NSString *)url parameters:(NSDictionary *)parameters success:(void(^)(id json))success failure:(void (^)(NSError *error))failure{
    static AFHTTPSessionManager *manager;
    //显示状态栏的网络指示器
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    manager=[AFHTTPSessionManager manager];
    //设置加载时间
    manager.requestSerializer.timeoutInterval=10;
    [manager GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //隐藏状态栏的网络指示器
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        failure(error);
    }];
}
@end
