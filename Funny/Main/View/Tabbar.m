//
//  Tabbar.m
//  Funny
//
//  Created by 黎铭轩 on 24/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import "Tabbar.h"
#import "Header.h"
#import "PublishView.h"
@interface Tabbar()
@property (strong, nonatomic)UIButton *publishButton;
@end
@implementation Tabbar
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UITabBarItem *item=[UITabBarItem appearance];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor darkGrayColor]} forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
        self.publishButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [self.publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [self.publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        self.publishButton.size=self.publishButton.currentImage.size;
        [[self.publishButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            PublishView *publishView=[PublishView publishView];
            publishView.frame=[UIScreen mainScreen].bounds;
            [[UIApplication sharedApplication].keyWindow addSubview:publishView];
        }];
        [self addSubview:self.publishButton];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat width=self.width;
    CGFloat height=self.height;
    NSInteger index=0;
    CGFloat buttonWidth=width / 5;
    CGFloat buttonHeight=height;
    self.publishButton.center=CGPointMake(width*0.5, height*0.5);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
