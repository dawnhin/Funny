//
//  MeViewController.m
//  Funny
//
//  Created by 黎铭轩 on 20/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import "MeViewController.h"
#import "MeTableViewCell.h"
#import "Header.h"
#import "SquareFooterView.h"
#import "LoginViewController.h"
@interface MeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic)UIButton *leftButton;
@property (strong, nonatomic)UIButton *rightButton;
@property (strong, nonatomic)UIView *lineView;
@property (strong, nonatomic)UIButton *settingButton;
@property (strong, nonatomic)UIButton *moonButton;
@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupTableView];
    [self setupNavigationItem];
}
- (void)setupTableView{
    [self.view addSubview: self.tableView];
    self.tableView.backgroundColor=BackgroundColor;
    self.tableView.sectionHeaderHeight=0;
    self.tableView.sectionFooterHeight=10;
    self.tableView.tableFooterView=[[SquareFooterView alloc]init];
}
-(void)setupNavigationItem{
    self.navigationItem.rightBarButtonItems=@[[[UIBarButtonItem alloc] initWithCustomView:self.settingButton],[[UIBarButtonItem alloc] initWithCustomView:self.moonButton]];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MeTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"MeTableViewCell"];
    if (!cell) {
        cell=[[MeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MeTableViewCell"];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        switch (indexPath.section) {
            case 0:{
                cell.imageView.image=[UIImage imageNamed: @"setup-head-default"];
                cell.textLabel.text=@"登录/注册";
                cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            }
                break;
            case 1:{
                cell.textLabel.text=@"离线下载";
                cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            }
                break;
            case 2:{
                [cell addSubview: self.leftButton];
                [cell addSubview: self.rightButton];
                [cell addSubview: self.lineView];
            }
                break;
            default:
                break;
        }
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
//            [self.navigationController pushViewController:[[LoginViewController alloc] init] animated:YES];
            [self presentViewController:[[LoginViewController alloc] init] animated:YES completion:nil];
            break;
            
        default:
            break;
    }
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
        _tableView.showsVerticalScrollIndicator=NO;
        _tableView.dataSource=self;
        _tableView.delegate=self;
    }
    return _tableView;
}
- (UIButton *)settingButton{
    if (!_settingButton) {
        _settingButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [_settingButton setBackgroundImage:[UIImage imageNamed:@"mine-setting-icon"] forState:UIControlStateNormal];
        [_settingButton setBackgroundImage:[UIImage imageNamed:@"mine-setting-icon-click"] forState:UIControlStateHighlighted];
        [_settingButton sizeToFit];
    }
    return _settingButton;
}
- (UIButton *)moonButton{
    if (!_moonButton) {
        _moonButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [_moonButton setBackgroundImage:[UIImage imageNamed:@"mine-moon-icon"] forState:UIControlStateNormal];
        [_moonButton setBackgroundImage:[UIImage imageNamed:@"mine-moon-icon-click"] forState:UIControlStateHighlighted];
        [_moonButton sizeToFit];
    }
    return _moonButton;
}
- (UIButton *)leftButton{
    if (!_leftButton) {
        _leftButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width*0.5, 44)];
        [_leftButton setTitle:@"#自拍#" forState:UIControlStateNormal];
        _leftButton.titleLabel.font=[UIFont systemFontOfSize:15];
        [_leftButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
    return _leftButton;
}
- (UIButton *)rightButton{
    if (!_rightButton) {
        _rightButton=[[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width*0.5, 0, [UIScreen mainScreen].bounds.size.width*0.5, 44)];
        [_rightButton setTitle:@"#我是段子手#" forState:UIControlStateNormal];
        _rightButton.titleLabel.font=[UIFont systemFontOfSize:15];
        [_rightButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
    return _rightButton;
}
- (UIView *)lineView{
    if (!_lineView) {
        _lineView=[[UIView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width*0.5, 2, 0.5, 40)];
        _lineView.backgroundColor=[[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
    }
    return _lineView;
}
@end
