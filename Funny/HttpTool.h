//
//  HttpTool.h
//  Funny
//
//  Created by 黎铭轩 on 23/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import <Foundation/Foundation.h>

//NS_ASSUME_NONNULL_BEGIN

@interface HttpTool : NSObject
+(void)get:(NSString *)url parameters:(NSDictionary *)parameters success:(void(^)(id json))success failure:(void (^)(NSError *error))failure;
@end

//NS_ASSUME_NONNULL_END
