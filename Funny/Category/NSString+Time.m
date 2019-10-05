//
//  NSString+Time.m
//  Funny
//
//  Created by 黎铭轩 on 24/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import "NSString+Time.h"

@implementation NSString (Time)
+ (NSString *)stringWithTime:(NSTimeInterval)time{
    NSInteger min=time / 60;
    NSInteger second=(NSInteger)time % 60;
    return [NSString stringWithFormat: @"%ld : %ld",min,second];
}
@end
