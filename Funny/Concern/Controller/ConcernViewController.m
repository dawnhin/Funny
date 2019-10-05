//
//  ConcernViewController.m
//  Funny
//
//  Created by 黎铭轩 on 20/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import "ConcernViewController.h"
#import "RecommendViewController.h"
#import "LoginViewController.h"
@interface ConcernViewController ()
@property (strong, nonatomic)UIButton *recommandButton;
@end

@implementation ConcernViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title=@"我的关注";
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:self.recommandButton];
}
- (IBAction)clickLogin {
    LoginViewController *loginViewController=[[LoginViewController alloc]init];
    [self presentViewController:loginViewController animated:YES completion:nil];
}
- (IBAction)clickRegister {
    LoginViewController *loginViewController=[[LoginViewController alloc]init];
    [self presentViewController:loginViewController animated:YES completion:nil];
}
-(void)push{
    RecommendViewController *recommend=[[RecommendViewController alloc]init];
    [self.navigationController pushViewController:recommend animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (UIButton *)recommandButton{
    if (!_recommandButton) {
        _recommandButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [_recommandButton setBackgroundImage:[UIImage imageNamed:@"friendsRecommentIcon"] forState:UIControlStateNormal];
        [_recommandButton setBackgroundImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] forState:UIControlStateHighlighted];
        [_recommandButton sizeToFit];
        [_recommandButton addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    }
    return _recommandButton;
}
@end
