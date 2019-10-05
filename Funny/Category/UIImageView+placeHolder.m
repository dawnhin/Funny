//
//  UIImageView+placeHolder.m
//  Funny
//
//  Created by 黎铭轩 on 23/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import "UIImageView+placeHolder.h"
#import <UIImageView+WebCache.h>
#import "UIImage+Circle.h"
@implementation UIImageView (placeHolder)
- (void)setHeader:(NSString *)url{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[[UIImage imageNamed:@"defaultUserIcon"] circleImage] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        self.image=image ? [image circleImage] : [[UIImage imageNamed:@"defaultUserIcon"] circleImage];
    }];
}
@end
