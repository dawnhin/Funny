//
//  PublishView.m
//  Funny
//
//  Created by 黎铭轩 on 24/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import "PublishView.h"

@implementation PublishView
+ (instancetype)publishView{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil][0];
}
- (void)awakeFromNib{
    [super awakeFromNib];
    NSArray *images=@[@"publish-video", @"publish-picture", @"publish-text", @"publish-audio", @"publish-review", @"publish-offline"];
    NSArray *titles=@[@"发视频", @"发图片", @"发段子", @"发声音", @"审帖", @"发链接"];
    NSInteger maxColumn=3;
    CGFloat buttonWidth=3;
    CGFloat buttonHeight=70;
    CGFloat startX=20;
    CGFloat startY=[UIScreen mainScreen].bounds.size.height*0.4;
    CGFloat margin=([UIScreen mainScreen].bounds.size.width-2*startX-maxColumn*buttonWidth)/2;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
