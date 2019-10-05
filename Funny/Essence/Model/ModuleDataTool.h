//
//  ModuleDataTool.h
//  Funny
//
//  Created by 黎铭轩 on 23/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Header.h"
//NS_ASSUME_NONNULL_BEGIN

@interface ModuleDataTool : NSObject
/**
 *  首次刷新（不需要传页码）
 *
 *  @param block 回调
 */
-(void)getDataWithArrayType:(TopicType)type parameter:(NSString *)parameter block:(void (^)(id json,id parameter))block;
/**
 *  加载更多数据（需要传页码）
 *
 *  @param maxtime 参数
 *  @param page    页码
 *  @param block   回调
 */
-(void)getDataWithMaxtime:(NSString *)maxtime page:(NSNumber *)page topicType:(TopicType)type parameter:(NSString *)parameter block:(void (^)(id json,id parameter))block;
/**
 *  加载最新的评论（最热和最新评论）
 *
 *  @param ID    ID
 *  @param block 回调
 */
-(void)getCommentsWithID:(NSString *)ID block:(void (^)(id json1,id json2))block;
-(void)getCommentsWithID:(NSString *)ID page:(NSInteger)page lastcid:(NSString *)lastcid block:(void (^)(id json, NSInteger total))block;
@end

//NS_ASSUME_NONNULL_END
