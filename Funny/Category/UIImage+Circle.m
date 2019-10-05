//
//  UIImage+Circle.m
//  Funny
//
//  Created by 黎铭轩 on 23/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import "UIImage+Circle.h"

@implementation UIImage (Circle)
- (UIImage *)circleImage{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    CGContextRef ref=UIGraphicsGetCurrentContext();
    CGRect rect=CGRectMake(0, 0, self.size.width, self.size.height);
    // 添加一个圆
    CGContextAddEllipseInRect(ref, rect);
    // 裁剪
    CGContextClip(ref);
    // 将图片画上去
    [self drawInRect:rect];
    //获取上下文图片
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    //结束上下文
    UIGraphicsEndImageContext();
    return image;
}
@end
