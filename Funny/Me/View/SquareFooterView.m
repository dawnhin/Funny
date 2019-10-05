//
//  SquareFooterView.m
//  Funny
//
//  Created by 黎铭轩 on 4/10/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import "SquareFooterView.h"
#import "SquareTool.h"
#import "SquareButton.h"
#import "WebViewController.h"
#import <MJExtension/MJExtension.h>
@implementation SquareFooterView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
        [self createItems];
    }
    return self;
}
-(void)createItems{
    NSInteger maxCols=4;
    CGFloat buttonWidth=[UIScreen mainScreen].bounds.size.width/4;
    CGFloat buttonHeight=buttonWidth;
    SquareTool *tool=[[SquareTool alloc]init];

    [tool getSquareData:^(NSArray * _Nonnull array) {
        for (NSInteger i=0; i<array.count-1; i++) {
            SquareButton *button=[[SquareButton alloc]init];
            NSInteger column=i % maxCols;
            NSInteger row=i / maxCols;
            CGFloat buttonX=column*buttonWidth;
            CGFloat buttonY=row*buttonHeight;

            button.frame=CGRectMake(buttonX, buttonY, buttonWidth, buttonHeight);
            button.square=[Square mj_objectWithKeyValues:array[i]];
            [self addSubview:button];

            [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        }
    }];
}
-(void)clickButton:(SquareButton *)button{
    if (![button.square.url hasPrefix: @"http"]) {
        return;
    }
    WebViewController *webView=[[WebViewController alloc]init];
    webView.url=button.square.url;
    webView.title=button.square.name;
    UITabBarController *tabbarController=(UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    UINavigationController *navigationController=(UINavigationController *)tabbarController.selectedViewController;
    [navigationController pushViewController:webView animated:YES];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
