//
//  SquareTool.h
//  Funny
//
//  Created by 黎铭轩 on 4/10/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SquareTool : NSObject
-(void)getSquareData:(void (^)(id json))block;
@end

NS_ASSUME_NONNULL_END
