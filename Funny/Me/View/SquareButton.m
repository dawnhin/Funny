//
//  SquareButton.m
//  Funny
//
//  Created by 黎铭轩 on 4/10/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import "SquareButton.h"
#import "Header.h"
#import <SDWebImage/SDWebImage.h>
@implementation SquareButton
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.titleLabel.font=[UIFont systemFontOfSize:14];
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    // 调整图片
    self.imageView.y=self.height*0.15;
    self.imageView.width=self.width*0.5;
    self.imageView.height=self.imageView.width;
    self.imageView.centerX=self.width*0.5;
    
    self.titleLabel.x=0;
    self.titleLabel.y=CGRectGetMaxY(self.imageView.frame);
    self.titleLabel.width=self.width;
    self.titleLabel.height=self.height-self.titleLabel.y;
}
- (void)setSquare:(Square *)square{
    _square=square;
    [self setTitle:square.name forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageNamed:square.icon] forState:UIControlStateNormal];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
