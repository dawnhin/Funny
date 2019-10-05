//
//  RcommandDataTool.h
//  Funny
//
//  Created by 黎铭轩 on 30/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
typedef void(^Block)(id json);
@interface RcommandDataTool : NSObject
/**
 *  获取左边栏数据
 *
 *  @param block 回调
 */
-(void)getCategoryData:(Block)block;
/**
 *  获取右边栏数据，用于刷新数据，无需页码参数
 *
 *  @param Id    选中的ID
 *  @param block 回调
 */
-(void)getMainDataWithID:(NSNumber *)Id block:(Block)block;
/**
 *  用于右边栏数据用于加载更多
 *
 *  @param Id          选中ID
 *  @param currentPage 当前页码
 *  @param block       回调
 */
-(void)getMainDataWithID:(NSNumber *)Id currentPage:(NSInteger)currentPage block:(Block)block;
@end

NS_ASSUME_NONNULL_END
