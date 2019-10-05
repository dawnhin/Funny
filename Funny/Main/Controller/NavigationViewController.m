//
//  NavigationViewController.m
//  Funny
//
//  Created by 黎铭轩 on 20/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import "NavigationViewController.h"
#import "Header.h"
@interface NavigationViewController ()
@property (strong, nonatomic)UIButton *backButton;
@end

@implementation NavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
+ (void)initialize
{
    if (self == [UINavigationController class]) {
        UIImage *background=[UIImage imageNamed:@"navigationbarBackgroundWhite"];
        //设置导航条
        UINavigationBar *navigationBar=[UINavigationBar appearance];
        [navigationBar setBackgroundImage:background forBarMetrics:UIBarMetricsDefault];
        [navigationBar setTitleTextAttributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:20]}];
    }
}
#pragma mark - push进来的控制器
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count) {
        //设置返回按钮
        viewController.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:self.backButton];
        viewController.hidesBottomBarWhenPushed=true;
    }
    [super pushViewController:viewController animated:animated];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (UIButton *)backButton{
    if (!_backButton) {
        _backButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [_backButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [_backButton setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [_backButton setTitle:@"返回" forState:UIControlStateNormal];
        [_backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [_backButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
        _backButton.contentEdgeInsets=UIEdgeInsetsMake(0, -5, 0, 0);
        [_backButton sizeToFit];
        //点击返回
        [[_backButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            [self popViewControllerAnimated:YES];
        }];
    }
    return _backButton;
}
@end
