//
//  TabBarViewController.m
//  Funny
//
//  Created by 黎铭轩 on 20/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import "TabBarViewController.h"
#import "NavigationViewController.h"
#import "EssenceViewController.h"
#import "ConcernViewController.h"
#import "LatestViewController.h"
#import "MeViewController.h"
@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initialController];
}
#pragma mark - 初始子控制器
-(void)initialController{
    [self setupController:[[EssenceViewController alloc] init] image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon" title:@"精华"];
    [self setupController:[[ConcernViewController alloc] init] image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon" title:@"关注"];
    [self setupController:[[LatestViewController alloc] init] image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon" title:@"最新"];
    [self setupController:[[MeViewController alloc] init] image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon" title:@"我"];
}
#pragma mark - 设置TabbarViewController子控制器
-(void)setupController:(UIViewController *)viewController image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title{
    viewController.tabBarItem.image=[[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage=[[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.title=title;
    //设置导航控制器根控制器
    NavigationViewController *navigationViewController=[[NavigationViewController alloc]initWithRootViewController:viewController];
    [self addChildViewController:navigationViewController];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
