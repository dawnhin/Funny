//
//  LoginViewController.m
//  Funny
//
//  Created by 黎铭轩 on 28/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import "LoginViewController.h"
#import "UIView+Extension.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftlineWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightlineWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewLeft;
@property (weak, nonatomic) IBOutlet UIButton *forgetButton;
@property (weak, nonatomic) IBOutlet UIButton *QQ;
@property (weak, nonatomic) IBOutlet UIButton *sina;
@property (weak, nonatomic) IBOutlet UIButton *tencent;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) IBOutlet UILabel *quickLabel;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.topConstraint.constant=-250;
    self.leftlineWidth.constant=0;
    self.rightlineWidth.constant=0;
    
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [UIView animateWithDuration:1 animations:^{
        self.closeButton.transform=CGAffineTransformMakeRotation(M_PI);
    }];
    self.topConstraint.constant=40;
    self.leftlineWidth.constant=103;
    self.rightlineWidth.constant=103;
    [UIView animateWithDuration:1 delay:0.5 usingSpringWithDamping:0.3 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        //刷新view
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self setupAnimationWithStartRect:CGRectMake(0, 0, 0, CGRectGetHeight(self.forgetButton.frame)) endRect:CGRectMake(0, 0, CGRectGetWidth(self.forgetButton.frame), CGRectGetHeight(self.forgetButton.frame)) object:self.forgetButton duration:0.5];
        //注册按钮动画
        [self setupAnimationWithStartRect:CGRectMake(-(CGRectGetWidth(self.registerButton.frame)), 0, 0, CGRectGetHeight(self.registerButton.frame)) endRect:CGRectMake(0, 0, CGRectGetWidth(self.registerButton.frame), CGRectGetHeight(self.registerButton.frame)) object:self.registerButton duration:0.5];
        //注册按钮动画
        [self setupAnimationWithStartRect:CGRectMake(-(CGRectGetWidth(self.registerButton.frame)), 0, 0, CGRectGetHeight(self.registerButton.frame)) endRect:CGRectMake(0, 0, CGRectGetWidth(self.registerButton.frame), CGRectGetHeight(self.registerButton.frame)) object:self.registerButton duration:0.5];
    }];
    
    [self setupAnimationWithStartRect:CGRectMake((self.quickLabel.width)*0.5, 0, 0, CGRectGetHeight(self.quickLabel.frame)) endRect:CGRectMake(0, 0, CGRectGetWidth(self.quickLabel.frame), CGRectGetHeight(self.quickLabel.frame)) object:self.quickLabel duration:0.5];
    [UIView animateWithDuration:0.1 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        self.QQ.transform=CGAffineTransformMakeScale(0.01, 0.01);
        self.sina.transform=CGAffineTransformMakeScale(0.01, 0.01);
        self.tencent.transform=CGAffineTransformMakeScale(0.01, 0.01);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 delay:1.5 usingSpringWithDamping:0.4 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
            self.QQ.transform=CGAffineTransformIdentity;
            self.sina.transform=CGAffineTransformIdentity;
            self.tencent.transform=CGAffineTransformIdentity;
        } completion: nil];
    }];
}
- (IBAction)clickregister:(UIButton *)sender {
    if (self.textViewLeft.constant==0) {
        //隐藏登录界面
        self.textViewLeft.constant=-self.view.width;
        sender.selected=YES;
    }
    else{
        //显示登录界面
        self.textViewLeft.constant=0;
        sender.selected=NO;
    }
    [UIView animateWithDuration:1 animations:^{
        [self.view layoutIfNeeded];
    }];
}

#pragma mark - 设置动画
-(void)setupAnimationWithStartRect:(CGRect)startRect endRect:(CGRect)endRect object:(UIView *)view duration:(NSTimeInterval)duration{
    UIBezierPath *beginPath=[UIBezierPath bezierPathWithRect:startRect];
    UIBezierPath *endPath=[UIBezierPath bezierPathWithRect:endRect];
    CAShapeLayer *quickMask=[[CAShapeLayer alloc]init];
    quickMask.path=endPath.CGPath;
    quickMask.fillColor=[UIColor whiteColor].CGColor;
    view.layer.mask=quickMask;
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"path"];
    animation.duration=duration;
    animation.beginTime=CACurrentMediaTime();
    animation.fromValue=(__bridge id _Nullable)(beginPath.CGPath);
    animation.toValue=(__bridge id _Nullable)(endPath.CGPath);
    [quickMask addAnimation:animation forKey:@"path"];
}
- (IBAction)clickClose {
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
@end
