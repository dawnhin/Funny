//
//  EssenceViewController.m
//  Funny
//
//  Created by 黎铭轩 on 20/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import "EssenceViewController.h"
#import "AllTableViewController.h"
#import "VideoTableViewController.h"
#import "PictrueTableViewController.h"
#import "VocieTableViewController.h"
#import "TalkTableViewController.h"
#import "Header.h"
@interface EssenceViewController ()<UIScrollViewDelegate>
@property (strong, nonatomic)UIButton *leftButton;
@property (strong, nonatomic)UIView *titleView;
@property (strong, nonatomic)UIView *indicator;
@property (strong, nonatomic)UIScrollView *scrollView;
@property (strong, nonatomic)UIButton *selectButton;
@end

@implementation EssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupNavigationBar];
    [self setupChildViewController];
    //添加scrollView到view上
    [self.view addSubview:self.scrollView];
    //添加titleView到view上
    [self.view addSubview:self.titleView];
    [self setupTitleButton];
}
#pragma mark - 设置导航栏
-(void)setupNavigationBar{
    [self.navigationItem setTitleView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]]];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:self.leftButton];
}
-(void)setupChildViewController{
    AllTableViewController *all=[[AllTableViewController alloc]init];
    [self addChildViewController:all];
    
    VideoTableViewController *video=[[VideoTableViewController alloc]init];
    [self addChildViewController:video];
    
    PictrueTableViewController *picture=[[PictrueTableViewController alloc]init];
    [self addChildViewController:picture];
    
    VocieTableViewController *voice=[[VocieTableViewController alloc] init];
    [self addChildViewController:voice];
    
    TalkTableViewController *talk=[[TalkTableViewController alloc]init];
    [self addChildViewController:talk];
}
#pragma mark - 设置标题按钮
-(void)setupTitleButton{
    NSArray *titles=[NSArray arrayWithObjects:@"推荐",@"视频",@"图片",@"声音",@"段子", nil];
    NSUInteger count=titles.count;
    CGFloat buttonHeight=self.titleView.height-self.indicator.height;
    CGFloat buttonWidth=self.titleView.width/count;
    CGFloat buttonY=0;
    for (NSInteger i=0; i<count; i++) {
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.titleLabel.font=[UIFont systemFontOfSize:13];
        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        CGFloat buttonX=i*buttonWidth;
        button.frame=CGRectMake(buttonX, buttonY, buttonWidth, buttonHeight);
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag=i;
        [self.titleView addSubview:button];
        if (button.tag==0) {
            self.selectButton=button;
            self.indicator.width=button.width;
            self.indicator.centerX=button.centerX;
        }
    }
    [self.titleView addSubview:self.indicator];
}
#pragma mark - 标题按钮点击
-(void)buttonClick:(UIButton *)button{
    self.selectButton.enabled=true;
    button.enabled=NO;
    self.selectButton=button;
    //指示器动画
    [UIView animateWithDuration:0.2 animations:^{
        self.indicator.width=button.width;
        self.indicator.centerX=button.centerX;
    }];
    //控制器view的滚动
    CGPoint offset=self.scrollView.contentOffset;
    offset.x=button.tag*self.scrollView.width;
    [self.scrollView setContentOffset:offset animated:true];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - 结束滚动时
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    //获取当前控制器View索引
    NSInteger index=scrollView.contentOffset.x/scrollView.width;
    UITableViewController *tableViewController=self.childViewControllers[index];
    tableViewController.view.x=scrollView.contentOffset.x;
    tableViewController.view.y=0;
    tableViewController.view.height=scrollView.height;
    CGFloat top=CGRectGetMaxY(self.titleView.frame);
    CGFloat bottom=self.tabBarController.tabBar.height;
    tableViewController.tableView.contentInset=UIEdgeInsetsMake(top, 0, bottom, 0);
    tableViewController.tableView.contentInsetAdjustmentBehavior=UIScrollViewContentInsetAdjustmentNever;
    [scrollView addSubview:tableViewController.tableView];
}
#pragma mark - 滚动减速时
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self scrollViewDidEndScrollingAnimation:scrollView];
    NSInteger index=scrollView.contentOffset.x / scrollView.width;
    [self buttonClick:self.titleView.subviews[index]];
}
- (UIButton *)leftButton{
    if (!_leftButton) {
        _leftButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [_leftButton setBackgroundImage:[UIImage imageNamed:@"MainTagSubIcon"] forState:UIControlStateNormal];
        [_leftButton setBackgroundImage:[UIImage imageNamed:@"MainTagSubIconClick"] forState:UIControlStateHighlighted];
        [_leftButton sizeToFit];
    }
    return _leftButton;
}
- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView=[[UIScrollView alloc] initWithFrame:self.view.bounds];
        _scrollView.delegate=self;
        _scrollView.pagingEnabled=YES;
        _scrollView.contentSize=CGSizeMake(_scrollView.frame.size.width*self.childViewControllers.count, _scrollView.frame.size.height);
        _scrollView.contentInsetAdjustmentBehavior=UIScrollViewContentInsetAdjustmentNever;
        _scrollView.showsHorizontalScrollIndicator=NO;
        [self scrollViewDidEndScrollingAnimation:_scrollView];
    }
    return _scrollView;
}
- (UIView *)titleView{
    if (!_titleView) {
        _titleView=[[UIView alloc]initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height+statusHeight, self.view.frame.size.width, 35)];
        _titleView.backgroundColor=[[UIColor whiteColor] colorWithAlphaComponent:0.7];
    }
    return _titleView;
}
- (UIView *)indicator{
    if (!_indicator) {
        _indicator=[[UIView alloc]init];
        _indicator.backgroundColor=[UIColor redColor];
        _indicator.height=2;
        _indicator.y=self.titleView.height-_indicator.height;
    }
    return _indicator;
}
@end
