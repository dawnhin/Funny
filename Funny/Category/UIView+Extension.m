//
//  UIView+Extension.m
//  Funny
//
//  Created by 黎铭轩 on 21/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)
- (void)setX:(CGFloat)x{
    CGRect rect=self.frame;
    rect.origin.x=x;
    self.frame=rect;
}
- (CGFloat)x{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y{
    CGRect rect=self.frame;
    rect.origin.y=y;
    self.frame=rect;
}
- (CGFloat)y{
    return self.frame.origin.y;
}
- (void)setCenterX:(CGFloat)centerX{
    CGPoint center=self.center;
    center.x=centerX;
    self.center=center;
}
- (CGFloat)centerX{
    return self.center.x;
}
- (void)setCenterY:(CGFloat)centerY{
    CGPoint center=self.center;
    center.y=centerY;
    self.center=center;
}
- (CGFloat)centerY{
    return self.center.y;
}
- (void)setWidth:(CGFloat)width{
    CGRect rect=self.frame;
    rect.size.width=width;
    self.frame=rect;
}
- (CGFloat)width{
    return self.frame.size.width;
}
- (void)setHeight:(CGFloat)height{
    CGRect rect=self.frame;
    rect.size.height=height;
    self.frame=rect;
}
- (CGFloat)height{
    return self.frame.size.height;
}
- (void)setSize:(CGSize)size{
    CGRect frame=self.frame;
    frame.size=size;
    self.frame=frame;
}
- (CGSize)size{
    return self.frame.size;
}
- (void)setOrigin:(CGPoint)origin{
    CGRect rect=self.frame;
    rect.origin=origin;
    self.frame=rect;
}
- (CGPoint)origin{
    return self.frame.origin;
}
@end
