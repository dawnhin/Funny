//
//  ContentPictureView.m
//  Funny
//
//  Created by 黎铭轩 on 23/9/2019.
//  Copyright © 2019 黎铭轩. All rights reserved.
//

#import "ContentPictureView.h"
#import <DACircularProgressView.h>
#import <UIImageView+WebCache.h>
@interface ContentPictureView()
@property (weak, nonatomic) IBOutlet UIImageView *gifView;
@property (weak, nonatomic) IBOutlet UIImageView *headerView;
@property (weak, nonatomic) IBOutlet UIButton *bigPictureButton;
@property (weak, nonatomic) IBOutlet DACircularProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end
@implementation ContentPictureView
+ (instancetype)pictureView{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil][0];
}
- (void)awakeFromNib{
    [super awakeFromNib];
    //禁用autoresizingMask
    self.autoresizingMask=UIViewAutoresizingNone;
    self.imageView.userInteractionEnabled=YES;
    [self.imageView addGestureRecognizer:[[UIGestureRecognizer alloc] initWithTarget:self action:@selector(showPicture)]];
}
-(void)showPicture{
    
}
- (void)setTopic:(TopicModel *)topic{
    [self.progressView setProgress:0 animated:NO];
    self.progressView.progressTintColor=[UIColor whiteColor];
    self.progressView.roundedCorners=3;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.image1] placeholderImage:nil options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
//        self.bigPictureButton.hidden=YES;
//        self.headerView.hidden=NO;
        CGFloat progress=receivedSize/expectedSize;
//        self.progressView.hidden=NO;
        
        [self.progressView setProgress:progress animated:YES];
    } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        self.progressView.hidden=YES;
        self.headerView.hidden=YES;
        //大图则截出图片的最上方铺满contentView
        if (topic.isBigImage) {
            // 开启图形上下文
            UIGraphicsBeginImageContextWithOptions(self.imageView.size, YES, 0);
            CGFloat width=self.imageView.width;
            CGFloat height=width * image.size.height / image.size.width;
            [image drawInRect:CGRectMake(0, 0, width, height)];
            // 获得图片
            self.imageView.image=UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            self.bigPictureButton.hidden=NO;
        }
        else{
            self.imageView.contentMode=UIViewContentModeScaleToFill;
            self.bigPictureButton.hidden=YES;
        }
    }];
    self.gifView.hidden = ![topic.middle_image.pathExtension.lowercaseString isEqualToString:@"gif"];
}
- (IBAction)ClickButton {
    [self showPicture];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
